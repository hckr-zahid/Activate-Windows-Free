
# Research-only downloader and evidence collector
# Downloads the referenced MAS_AIO.cmd for offline inspection.
# Does NOT execute downloaded code.

$ResearchFolder = 'D:\AAAAAAAAAAAAAAAAAAAAAAAAA\Research'

$ExpectedHash = '850F979665FB93999ACAE93F4790C1FF8ED2041532060B7966A121C2D29A0BFA'

$URLs = @(
    'https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/05c4f881efec946c0040cdd552d1afa9a519704b/MAS/All-In-One-Version-KL/MAS_AIO.cmd',
    'https://dev.azure.com/massgrave/Microsoft-Activation-Scripts/_apis/git/repositories/Microsoft-Activation-Scripts/items?path=/MAS/All-In-One-Version-KL/MAS_AIO.cmd&versionType=Commit&version=05c4f881efec946c0040cdd552d1afa9a519704b',
    'https://git.activated.win/Microsoft-Activation-Scripts/plain/MAS/All-In-One-Version-KL/MAS_AIO.cmd?id=05c4f881efec946c0040cdd552d1afa9a519704b'
)

# Create the evidence directory if needed.
try {
    New-Item -Path $ResearchFolder -ItemType Directory -Force -ErrorAction Stop |
        Out-Null
}
catch {
    Write-Error "Cannot create/access research folder: $ResearchFolder"
    Write-Error $_.Exception.Message
    return
}

# Give each collection run a unique timestamp.
$Timestamp = Get-Date -Format 'yyyyMMdd_HHmmss'
$FilePath = Join-Path $ResearchFolder "MAS_AIO_$Timestamp.cmd"
$MetadataPath = Join-Path $ResearchFolder "MAS_AIO_$Timestamp.metadata.json"

# Require TLS 1.2 where supported.
try {
    [Net.ServicePointManager]::SecurityProtocol =
        [Net.SecurityProtocolType]::Tls12
}
catch {
    Write-Warning "Could not explicitly configure TLS 1.2."
}

$Response = $null
$SelectedURL = $null
$Errors = @()

foreach ($URL in ($URLs | Sort-Object { Get-Random })) {
    try {
        Write-Host "Trying source: $URL"

        if ($PSVersionTable.PSVersion.Major -ge 3) {
            $Response = Invoke-RestMethod -Uri $URL -ErrorAction Stop
        }
        else {
            $Client = New-Object Net.WebClient
            $Response = $Client.DownloadString($URL)
        }

        if ($null -ne $Response -and "$Response".Length -gt 0) {
            $SelectedURL = $URL
            break
        }
    }
    catch {
        $Errors += "$URL : $($_.Exception.Message)"
        $Response = $null
    }
}

if ($null -eq $Response -or "$Response".Length -eq 0) {
    Write-Error "Download failed from all configured sources."
    $Errors | ForEach-Object { Write-Host $_ -ForegroundColor Red }
    return
}

# Encode the response as UTF-8 without a BOM.
# This follows the original launcher's text-based hash approach.
$Encoding = New-Object System.Text.UTF8Encoding($false)
$Bytes = $Encoding.GetBytes([string]$Response)

# Preserve the downloaded text for offline analysis BEFORE deciding
# whether it matches the expected hash. Nothing is executed.
try {
    [System.IO.File]::WriteAllBytes($FilePath, $Bytes)
}
catch {
    Write-Error "Could not save evidence: $($_.Exception.Message)"
    return
}

$SHA256 = [System.Security.Cryptography.SHA256]::Create()
try {
    $ActualHash = [BitConverter]::ToString(
        $SHA256.ComputeHash($Bytes)
    ).Replace('-', '')
}
finally {
    $SHA256.Dispose()
}

$HashMatches = ($ActualHash -eq $ExpectedHash)

$Metadata = [ordered]@{
    CollectedAtUtc = [DateTime]::UtcNow.ToString('o')
    SourceUrl      = $SelectedURL
    SavedFile      = $FilePath
    ExpectedSHA256 = $ExpectedHash
    ActualSHA256   = $ActualHash
    HashMatches    = $HashMatches
    Executed       = $false
    Notes          = 'Collected for static analysis; not executed.'
}

try {
    $Metadata | ConvertTo-Json -Depth 4 |
        Set-Content -LiteralPath $MetadataPath -Encoding UTF8
}
catch {
    Write-Warning "The script was saved, but metadata could not be saved."
    Write-Warning $_.Exception.Message
}

Write-Host ''
Write-Host 'Collection complete.' -ForegroundColor Green
Write-Host "Saved script: $FilePath"
Write-Host "Metadata:     $MetadataPath"
Write-Host "SHA-256:      $ActualHash"

if ($HashMatches) {
    Write-Host 'Hash matches the configured expected value.' -ForegroundColor Green
}
else {
    Write-Warning 'HASH MISMATCH: do not trust this file based on the configured hash.'
    Write-Warning 'The file has been preserved for investigation and was NOT executed.'
}

Write-Host ''
Write-Host 'No downloaded code was executed.'