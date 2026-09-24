# The Race Between Machine and Man: Implications of Technology for Growth, Factor Shares and Employment Formalization Notes

This is a lightweight handoff document for source-to-Lean mapping.

- Namespace: `AR18RaceManMachine`
- Official URL: https://www.nber.org/papers/w22252
- Source PDF: `source.pdf`
- Local source text cache, if generated: `source.txt` (ignored by Git in public workspaces)

## Pinned source

- Canonical source: NBER Working Paper 22252, revised June 2017.
- Official page: <https://www.nber.org/papers/w22252>
- DOI: `10.3386/w22252`.
- `source.pdf` SHA-256: `441d01202afd56ef8002fc24ffc2beb51191741c0b5accb11d2534620dd616b7`.
- `source.txt` SHA-256: `c7ecd631d13366894f6970c50fdafbe073028e3e6d73bd64bde8c66ea742f5cd`.
- The PDF has 87 pages. No arXiv copy was found during the source search, so
  the NBER revision is the canonical artifact for this run.

## Formalization boundary

The source-only pass read all 7,877 extracted lines before inspecting the Lean
surface. It identified 8 named assumptions, Propositions 1--9 and B1--B4,
Corollaries 1--2, and Lemmas A1--A3 and B1. This partial run transcribes only
the static environment, Assumptions 1--3, Proposition 1, and Corollary 1. Both
result proof endpoints remain explicit `sorry` obligations. No later result is
counted as formalized.

## Formalization checklist

- [x] Full named-result inventory recorded in `docs/FORMALIZATION_PLAN.md`.
- [ ] DAG graph includes all required paper-stage nodes and dependencies.
- [ ] README status and remaining-assumption notes match proof artifacts.
- [ ] Post-formalization library elevation pass completed: reusable proof
      results, techniques, and primitives were moved into `AppliedModelingLib` when
      local/low-risk, or recorded with destination modules in the final report.
- [ ] Recursive provenance is clear in the consolidated paper closeout. Run a
      standalone repository-wide provenance audit only for a named diagnostic
      failure or at an explicit integration/release boundary.
- [ ] Final status review completed before publishing.

## Notes

- Date reviewed: 2026-09-24
- Last theorem row formalized: statement skeleton for Corollary 1 (proof open)
- Outstanding assumptions / caveats: all dynamic/appendix results; source
  ambiguities listed in `docs/FORMALIZATION_WORKING_MEMO.md`; two explicit
  proof holes in `ProofInterface.lean`.
- Reusable library elevation candidates: CES production functions, continuous
  task-allocation thresholds, and comparative-static sign lemmas.

