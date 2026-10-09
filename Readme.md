<h1 align="center">🪟 Activate Windows with PowerShell</h1>


<p align="center">
  <strong>Windows Activation • PowerShell • Security Research</strong>
  <br />
  A research-oriented guide to understanding Windows activation workflows and PowerShell-based activation tools.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Windows-0078D4?style=for-the-badge&logo=windows&logoColor=white" alt="Windows Platform" />
  <img src="https://img.shields.io/badge/Shell-PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell" />
  <img src="https://img.shields.io/badge/Purpose-Education%20%26%20Research-8A2BE2?style=for-the-badge" alt="Educational and Research Purpose" />
</p>

---

## 📌 Overview

This project explores Windows activation workflows using PowerShell and **Microsoft Activation Scripts (MAS)**, with a focus on HWID-based activation concepts.

It is intended for educational purposes, technical research, and understanding the interaction between Windows licensing components and activation tools.

> [!IMPORTANT]
> Activation methods have different licensing implications. Use a valid license and ensure that your activities comply with Microsoft's applicable terms.

## 📑 Table of Contents

* [🎯 Objectives](#-objectives)
* [⚙️ Requirements](#️-requirements)
* [🚀 Getting Started](#-getting-started)
* [🔬 Technical Overview](#-technical-overview)
* [🔍 Verification](#-verification)
* [🔐 Security Considerations](#-security-considerations)
* [🛠️ Troubleshooting](#️-troubleshooting)
* [📚 References](#-references)
* [⚠️ Disclaimer](#️-disclaimer)

---

## 🎯 Objectives

* 🖥️ Understand Windows activation concepts.
* ⚡ Explore PowerShell-based administration.
* 🔬 Learn about HWID-based activation workflows.
* 🔍 Verify Windows activation status.
* 🔐 Understand the security risks of executing remote scripts.

## ⚙️ Requirements

Before beginning, ensure you have:

* Windows 10 or Windows 11.
* PowerShell or Windows Terminal.
* An internet connection when required.
* Administrator access for operations that require elevation.
* A valid Windows license where activation is required.

## 🚀 Getting Started

### Step 1 — Open PowerShell as Administrator

1. Press `Win + S` to open Windows Search.
2. Type `PowerShell`.
3. Right-click **Windows PowerShell** or **Terminal**.
4. Select **Run as administrator**.
5. Approve the User Account Control (UAC) prompt.

### Step 2 — Understand Remote Script Execution

PowerShell supports commands that retrieve and execute scripts from remote sources. A commonly discussed pattern is:

```powershell
irm https://get.activated.win | iex
```

**Command breakdown:**

| Command | Description                                                                          |
| ------- | ------------------------------------------------------------------------------------ |
| `irm`   | Alias for `Invoke-RestMethod`, which retrieves content from a resource.              |
| `iex`   | Alias for `Invoke-Expression`, which evaluates and executes a PowerShell expression. |
| `\|`    | Pipes the retrieved output into the next command.                                    |

> [!WARNING]
> Piping remote content directly into `iex` executes it without giving you a separate review step. If PowerShell is elevated, the script may run with administrator privileges. For research, obtain and inspect the script before execution, and use an isolated test environment.

### Step 3 — Explore HWID Activation Concepts

HWID refers to hardware identification. HWID-based activation tools aim to associate activation with a device's hardware identity.

When studying such tools, investigate:

* How the tool describes its activation method.
* What system components it modifies.
* What permissions it requests.
* How it reports success or failure.
* Whether its behavior complies with the applicable licensing terms.

Do not assume that a tool's description of an activation method guarantees a valid license or permanent activation.

### Step 4 — Verify Windows Activation

Use the built-in Windows licensing utility to request activation with an existing eligible license:

```powershell
slmgr.vbs /ato
```

To check the activation expiration status, run:

```powershell
slmgr.vbs /xpr
```

You can also navigate to the Activation page in Windows Settings.

---

## 🔬 Technical Overview

The following concepts are useful when researching Windows activation:

| Component               | Purpose                                                                                                  |
| ----------------------- | -------------------------------------------------------------------------------------------------------- |
| PowerShell              | Windows command-line automation and administration.                                                      |
| Windows licensing tools | Manage and report licensing operations.                                                                  |
| HWID                    | Hardware identification used by certain activation approaches.                                           |
| Digital license         | A Windows activation entitlement associated with a device or account under Microsoft's licensing system. |
| Remote scripts          | Scripts downloaded from a remote source for inspection or execution.                                     |

## 🔍 Verification Checklist

* [ ] Confirm the installed Windows edition.
* [ ] Check the reported activation status.
* [ ] Record any activation error codes.
* [ ] Document the commands used and their results.
* [ ] Review script provenance and behavior before execution.
* [ ] Ensure the activation method complies with applicable licensing terms.

## 🔐 Security Considerations

* Never execute an unfamiliar remote script blindly.
* Review source code before running downloaded scripts.
* Use a disposable virtual machine for controlled research.
* Take a snapshot before making system changes.
* Avoid exposing product keys, account details, or device identifiers.
* Prefer official Microsoft documentation and supported activation methods.

## 🛠️ Troubleshooting

| Issue                         | Recommended action                                          |
| ----------------------------- | ----------------------------------------------------------- |
| Activation fails              | Check the activation status and associated error code.      |
| Product key is rejected       | Confirm the key is valid for the installed Windows edition. |
| Internet connection fails     | Check connectivity and retry when service is available.     |
| Script behavior is unexpected | Stop execution and inspect the source and system changes.   |
| Activation status is unclear  | Review Windows Settings and the output of `slmgr.vbs /xpr`. |
---

## 🔎 Static Security Research

This repository includes a static security analysis of `MAS_AIO.cmd`, examining Windows system-integrity implications and activation-related behavior.

### Research topics

* Windows and Office licensing-related modifications
* DLL replacement and software integrity
* Scheduled tasks and recurring execution
* Registry, service, and licensing-store changes
* Network behavior and external endpoints
* Defensive recommendations and research limitations

### Read the research

📂 **[Explore the Research folder](Research/)**

* [Research overview](Research/README.md)
* [Key findings](Research/FINDINGS_SUMMARY.md)
* [Analysis methodology](Research/METHODOLOGY.md)
* [Evidence index](Research/EVIDENCE_INDEX.md)
* [Research ethics and limitations](Research/RESEARCH_ETHICS.md)
* [Read the full report (PDF)](Research/report/MAS_AIO_CMD_Static_Security_Research_Report.pdf)
* [Download the full report (DOCX)](Research/report/MAS_AIO_CMD_Static_Security_Research_Report.docx)

### Research limitations

This assessment is based on static source-code review. The analyzed script was not executed as part of this research. Findings describe observed code behavior and potential risks; they do not establish that the script is malware or guarantee that it is safe.

## 📚 References

* [Windows Activation Support](https://support.microsoft.com/windows/activation-in-windows)
* [Activate Windows](https://support.microsoft.com/windows/activate-windows)
* [PowerShell Documentation](https://learn.microsoft.com/powershell/)
* [Microsoft Learn — Windows Client Licensing and Activation](https://learn.microsoft.com/windows/deployment/)

## ⚠️ Disclaimer

This repository is intended for educational, informational, and research purposes only.

Windows activation must comply with Microsoft's applicable licensing terms. Research scripts should be reviewed before execution, and testing should be performed only on systems you own or are authorized to administer.

This project is independent and is not affiliated with or endorsed by Microsoft.

---

<p align="center">
  <strong>⭐ Learn • Research • Document • Share</strong>
  <br />
  If you find this documentation useful, consider starring the repository.
</p>
