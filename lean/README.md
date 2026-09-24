<!-- BEGIN GENERATED PAPER FOLDER README -->
# The Race Between Machine and Man: Implications of Technology for Growth, Factor Shares and Employment

| Field | Value |
|---|---|
| Final status | Partially formalized |
| Paper reference | Daron Acemoglu and Pascual Restrepo, NBER Working Paper 22252, revised June 2017. |
| Lines of Code | 251 |

## Key Links

- Final validation report: not tracked in this folder.
- Dependency DAG: not tracked in this folder.
- Compact Lean interface: [PaperInterface.lean](PaperInterface.lean)
- Source/status JSON: [status.json](status.json).
- Additional documentation: [FORMALIZATION_NOTES.md](docs/FORMALIZATION_NOTES.md)

## Current boundary

The source-only inventory covers every named theoretical result in the pinned
revision. The checked Lean slice currently targets the static environment,
Assumptions 1--3, Proposition 1, and Corollary 1. The two result proofs remain
explicit holes, and all later named results are recorded as unformalized rather
than being hidden behind model assumptions.

Build verification is blocked in this checkout by missing Mathlib binary
caches on the Windows-mounted WSL filesystem. The bounded paper build and fast
check made measurable dependency-compilation progress but did not reach the
paper modules; the exact final attempt is recorded under `audit/`.
<!-- END GENERATED PAPER FOLDER README -->
