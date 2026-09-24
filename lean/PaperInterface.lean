import AR18RaceManMachine.Assumptions

/-!
# Human-facing interface: The Race Between Machine and Man

This first source-pinned slice exposes the static environment, named
Assumptions 1--3, Proposition 1, and Corollary 1.  It does not claim coverage of
the remaining named dynamic and appendix results listed in the paper inventory.
-/

namespace AR18RaceManMachine
namespace PaperInterface

/-- Proposition 1 (Equilibrium in the static model), source lines 613--643.

Under the static environment and Assumptions 1--3, there is exactly one static
equilibrium, and its output satisfies equation (12).
-/
def proposition1_static_equilibriumSpec (D : StaticModel) : Prop :=
  StaticEnvironment D →
    Assumption1 D →
    Assumption2 D →
    Assumption3 D →
    (∃! E : StaticOutcome, StaticEquilibrium D E) ∧
      ∀ E : StaticOutcome, StaticEquilibrium D E → Equation12Output D E

/-- Corollary 1, source lines 708--715.

In the unit-elasticity, unit-productivity special case, every static equilibrium
has the displayed Cobb--Douglas output formula.  The source states this as a
special case of Proposition 1 but does not repeat Assumptions 1--3; notably,
constant `gamma` is incompatible with strict monotonicity, so no silent
Assumption-1 premise is inserted here.
-/
def corollary1_cobb_douglas_outputSpec (D : StaticModel) : Prop :=
  D.taskElasticity = 1 →
    D.taskInputElasticity = 1 →
    (∀ i : ℝ, D.laborProductivity i = 1) →
    ∀ E : StaticOutcome, StaticEquilibrium D E → Corollary1Output D E

end PaperInterface
end AR18RaceManMachine
