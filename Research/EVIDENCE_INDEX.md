# Evidence Index

The full report contains a more detailed source line-range index. The ranges below are approximate pointers into the analyzed copy `MAS_AIO_20261009_074136.cmd` and should be checked against that exact artifact.

| Topic | Approximate source lines | What to verify |
|---|---:|---|
| Startup and dispatch | 1–559 | Entry points, argument handling, environment checks, elevation |
| HWID / GenuineTicket | 908–950 | Ticket and activation-related flow |
| Network diagnostics | 1000–1045 | Connectivity and endpoint checks |
| Existing activator checks | 1510–1569 | Host and software checks |
| Service configuration | 1680–1710 | Activation-related service configuration |
| SkipRearm / task cleanup | 2130–2168 | Related system and task operations |
| Office Ohook | 2730–2992 | Office activation modification workflow |
| DLL replacement | 3190–3315 | Office DLL file operations |
| PE timestamp / payload notes | 4040–4130 | File metadata and payload-related comments |
| TSforge | 4272–4350; 5830–5912 | Licensing-store workflow |
| BatchActivation SOAP request | 6140–6285 | Request construction and destination |
| Licensing-store read/write | 7835–7890 | Store access and modification |
| Product/grace/key-lock data | 8440–8540 | Specific licensing fields affected |
| Tamper flags | 8820–8865 | Related licensing/tamper-state handling |
| Store modifications | 10159–10560 | Additional store write operations |
| KMS activation | 12620–12709 | KMS activation flow |
| Renewal task payload | 13075–13200 | Scheduled execution content |
| KMS cleanup/server selection | 13433–13545 | Endpoint selection and configuration |
| Task XML | 13636–13757 | Scheduled-task properties |
| SPP cleanup | 16390–16479 | Software Protection Platform cleanup |
| WMI repair | 16720–16789 | WMI service/repository actions |
| Office release-data request | 19120–19128 | External metadata request |

## Confidence note

Line ranges are navigation aids, not independent proof. Cite the exact line(s), relevant function, and context when making a claim. Re-check all line references if the analyzed file differs by even one revision.
