# Static Security Analysis of `MAS_AIO.cmd`

> **Research type:** Static source-code analysis  
> **Focus:** Windows system integrity, licensing-related changes, scheduled execution, DLL replacement, and network behavior  
> **Execution status:** The analyzed script was not executed as part of this research

## Overview

This repository documents a static security review of `MAS_AIO.cmd`, a Windows activation and licensing modification script associated with the Microsoft Activation Scripts (MAS) project.

The analysis focuses on what the reviewed source code appears designed to do, which Windows components it changes, and what system-integrity risks administrators should consider. It distinguishes observed code behavior from potential risks and from claims that cannot be established by static review alone.

## Key findings

- The script includes multiple activation and licensing-related workflows that can modify Windows or Office state.
- Reviewed code includes DLL replacement mechanisms associated with Office activation modification.
- The script can create scheduled tasks for recurring or logon-triggered activation-related execution.
- Some branches modify licensing-store data, registry settings, services, or other system configuration.
- The script includes network operations such as connectivity checks and requests to specified endpoints.
- A troubleshooting path includes significant WMI repository/service repair operations.
- The reviewed source did **not** establish credential theft or general-purpose malware behavior. This is not a guarantee that every code path or embedded component is safe.

## Report

Read the full research report in [`report/`](report/). The DOCX is the primary report currently included. If you add a PDF, link it here as well.

## Scope and limitations

This is a **static analysis** based on source inspection. The script was not executed for this assessment. Embedded binaries, every runtime branch, and all possible effects were not independently analyzed in a controlled environment. Static analysis cannot establish the complete behavior of code that was not executed or of payloads that were not separately examined.

The findings are not a blanket declaration that the project is malware, nor a declaration that it is safe. Interpret conclusions in the context of the stated scope and evidence.

## Artifact identification

- **Analyzed file:** `MAS_AIO_20261009_074136.cmd`
- **Reported script version:** `3.12`
- **SHA-256:** `850F979665FB93999ACAE93F4790C1FF8ED2041532060B7966A121C2D29A0BFA`
- **Upstream commit referenced during analysis:** `05c4f881efec946c0040cdd552d1afa9a519704b`

Hashes identify file content; a matching hash does not independently prove that a file is safe or trustworthy. Confirm the artifact and commit yourself before relying on these identifiers.


## Repository map

```text
Research/
├── README.md
├── METHODOLOGY.md
├── FINDINGS_SUMMARY.md
├── EVIDENCE_INDEX.md
├── RESEARCH_ETHICS.md
└── report/
    └── MAS_AIO_CMD_Static_Security_Research_Report.pdf
```

```

## Intended audience

Windows security researchers, system administrators, incident responders, and cybersecurity learners interested in script analysis and software integrity.

## Responsible use

This repository is for defensive research, education, and informed software-risk assessment. Do not run unfamiliar scripts on production systems. Use a disposable, isolated test environment when dynamic analysis is necessary.

## Feedback

If you identify a factual error, please provide a reproducible reference to the relevant source line or documentation. Separate confirmed observations from hypotheses.
