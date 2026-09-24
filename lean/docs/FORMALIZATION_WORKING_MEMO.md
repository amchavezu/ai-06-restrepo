# Formalization Working Memo: The Race Between Machine and Man: Implications of Technology for Growth, Factor Shares and Employment

This is a working lead log, not audit evidence and not a final validation
report. Record possible issues while reading and proving; independently verify
each retained item against the pinned source and final Lean surface during
closeout.

For every item, record the exact source location, current mathematical reading,
Lean treatment, and review state. Prefer “clarification” unless the printed
formula or statement is actually false.

## Possible Source Clarifications

- `source.txt:406-410`: Assumption 2 says `eta -> 0` while the environment has
  `eta in (0,1)`. Lean keeps a limiting-regime tag; a genuine limit theorem is
  still needed.
- `source.txt:708-715`: Corollary 1 sets `gamma(i)=1`, contradicting the strict
  increase in Assumption 1. The corollary does not repeat Assumptions 1--3, so
  the current Spec does not silently insert them.
- `source.txt:2188-2190` and `7140-7145`: extraction corrupts the ordering and
  threshold condition in Propositions 9/B2; printed pages must govern.

## Possible Printed Typos Or Errors

- `source.txt:7640-7642`: Proposition B3 cites Assumption 1'' immediately after
  Assumption 2'' is introduced; likely cross-reference error, not corrected.
- `source.txt:7640`: Proposition B3 title uses epsilon in `(0,1)` although the
  model parameter appears to be nu; unresolved.
- `source.txt:7634-7649`: Proposition B3 says equations (8) and (9) remain valid
  even though the preceding model says capital demand changes; unresolved.
- `source.txt:2373-2378` versus `5260-5265`: Assumption 2' and its proof use
  different final exponents (`eta` versus `zeta`).
- `source.txt:5278-5391`: Proposition B1's displayed new-task derivative has a
  minus sign that conflicts with the stated positive comparative-static clause.
- `source.txt:1270`: Proposition 4 says “if only if”; likely intended “if and
  only if,” but no correction has been adopted.

## Possible Proof-Strategy Deviations

- No proof-strategy repair has been accepted. The two drafted named results
  retain explicit `sorry` endpoints.

## Possible Model Conventions Or Extra Assumptions

- Assumption 3 is represented with factor-price functions indexed by the
  counterfactual capital stock so that the printed definition of `K_bar` remains
  visible. This is a model interface, not a new proposition-level premise.
- Static integrals use Mathlib interval integrals and real powers. Positivity
  and integrability obligations have not been hidden in a certificate.

## Deferred Formalization Or Library Work

- All named results after Corollary 1, plus Assumptions 1', 4, 1'', 2', 2''.
- Complete source-map materialization, v11 raw-source-to-expanded-Spec review,
  assumption review, proof-fidelity review, and closeout artifacts.
- Reusable CES/threshold/comparative-static library components.
