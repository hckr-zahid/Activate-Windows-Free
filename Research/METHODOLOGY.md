# Methodology

## Assessment type

This project records a static review of a Windows batch script. The source was inspected without executing the analyzed script.

## Review approach

The review considered:

1. Entry points, argument handling, environment checks, and elevation behavior.
2. Windows and Office activation-related workflows.
3. Changes to files, DLLs, registry values, services, scheduled tasks, and licensing stores.
4. Network requests and connectivity checks visible in the reviewed source.
5. Cleanup, recovery, and troubleshooting behavior.
6. Security implications, confidence, and limitations of the evidence.

## Evidence standard

Findings should be described using one of these categories:

- **Observed in source:** a behavior directly indicated by the reviewed code.
- **Potential impact:** a plausible consequence of that behavior, dependent on context or successful execution.
- **Not established:** a claim that the available static evidence does not prove.
- **Not assessed:** behavior outside the scope of this review, including unexamined payloads or runtime-only behavior.

Source line numbers refer to the analyzed copy and may change between versions. Verify line numbers against the exact file and commit under review.

## Integrity and provenance

The report records the file name, version, SHA-256 digest, and upstream commit identifier available during analysis. These details help identify the artifact. A hash match proves only that the compared bytes match the expected digest; it does not establish that the content is benign.

## Limitations

- The script was not executed.
- No controlled dynamic analysis or network capture was performed for this assessment.
- Embedded DLLs and other payloads were not independently reverse-engineered as part of the static script review.
- Static review may miss behavior hidden in runtime-generated content, external dependencies, or code paths not fully examined.
- The report is an assessment of the reviewed artifact, not every release or copy of the project.

## Reproduction checklist

To reproduce or extend the review:

1. Obtain the source from the project's official upstream location.
2. Record the exact URL, commit, retrieval date, and file hash.
3. Compare the file to the artifact identifiers in the report.
4. Inspect the source without executing it.
5. Validate every finding against the exact source lines.
6. If dynamic analysis is needed, use an isolated disposable VM with snapshots and controlled networking.
7. Document any differences from the original report, including tool versions and test conditions.
