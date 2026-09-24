import AR18RaceManMachine.MainTheorems

/-!
# Named static-model assumptions

These declarations transcribe Assumptions 1--3 at the first formalization
boundary.  Later dynamic and appendix assumptions remain inventoried but are
not represented by declarations in this partial run.
-/

namespace AR18RaceManMachine

/-- Assumption 1: labor productivity `gamma(i)` is strictly increasing. -/
def Assumption1 (D : StaticModel) : Prop :=
  StrictMono D.laborProductivity

/-- Assumption 2: either the `eta -> 0` limiting regime is used or `zeta = 1`.

The limiting branch remains an explicit tag rather than the false literal
substitution `eta = 0`, which would contradict the source environment's
`eta in (0,1)` restriction.
-/
def Assumption2 (D : StaticModel) : Prop :=
  D.homotheticRegime = .vanishingIntermediateShare ∨
    (D.homotheticRegime = .unitTaskSubstitution ∧
      D.taskInputElasticity = 1)

/-- Assumption 3: at the capital stock `K_bar` where
`R = W / gamma(N)`, the actual stock satisfies `K < K_bar`. -/
def Assumption3 (D : StaticModel) : Prop :=
  D.rentalAtCapital D.thresholdCapitalStock =
      D.wageAtCapital D.thresholdCapitalStock /
        D.laborProductivity D.newTaskFrontier ∧
    D.capitalStock < D.thresholdCapitalStock

end AR18RaceManMachine
