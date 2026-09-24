import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic

/-!
# Static model primitives for Acemoglu--Restrepo (2018)

This file contains only the mathematical objects used by the first checked
formalization slice: the static environment, equations (6), (8)--(11), and the
aggregate-output expression (12).  The paper's named assumptions and result
Specs live in the human-facing files that import this module.
-/

namespace AR18RaceManMachine

open Set
open scoped Interval

/-- The two branches of the paper's Assumption 2.

The first constructor is deliberately a regime marker: the paper writes
`eta -> 0`, not `eta = 0`, while maintaining `eta in (0,1)` in the environment.
No equality at the limiting value is silently substituted here.
-/
inductive HomotheticRegime where
  | vanishingIntermediateShare
  | unitTaskSubstitution
  deriving DecidableEq

/-- Source-shaped data for the static model in Sections 2.1--2.2. -/
structure StaticModel where
  /-- Elasticity between tasks, `sigma`. -/
  taskElasticity : ℝ
  /-- Elasticity between intermediates and labor, `zeta`. -/
  taskInputElasticity : ℝ
  /-- Intermediate-input share, `eta`. -/
  intermediateShare : ℝ
  /-- Normalization `B` used from equation (7) onward. -/
  productivityScale : ℝ
  /-- Upper end `N` of the unit-measure task interval. -/
  newTaskFrontier : ℝ
  /-- Automation frontier `I`. -/
  automationFrontier : ℝ
  /-- Fixed capital stock `K`. -/
  capitalStock : ℝ
  /-- Threshold capital stock `K_bar` in Assumption 3. -/
  thresholdCapitalStock : ℝ
  /-- Labor productivity schedule `gamma`. -/
  laborProductivity : ℝ → ℝ
  /-- Increasing quasi-labor-supply schedule `L^s`. -/
  laborSupply : ℝ → ℝ
  /-- Rental rate evaluated at a counterfactual capital stock. -/
  rentalAtCapital : ℝ → ℝ
  /-- Wage evaluated at a counterfactual capital stock. -/
  wageAtCapital : ℝ → ℝ
  /-- Which of the two homothetic regimes in Assumption 2 is used. -/
  homotheticRegime : HomotheticRegime

/-- The paper's `hat sigma = sigma (1-eta) + zeta eta`. -/
def effectiveElasticity (D : StaticModel) : ℝ :=
  D.taskElasticity * (1 - D.intermediateShare) +
    D.taskInputElasticity * D.intermediateShare

/-- Background domain restrictions stated in the static environment. -/
def StaticEnvironment (D : StaticModel) : Prop :=
  0 < D.taskElasticity ∧
    0 < D.taskInputElasticity ∧
    0 < D.intermediateShare ∧ D.intermediateShare < 1 ∧
    0 < D.productivityScale ∧
    D.newTaskFrontier - 1 < D.automationFrontier ∧
    D.automationFrontier ≤ D.newTaskFrontier ∧
    0 < D.capitalStock ∧
    StrictMono D.laborSupply

/-- The six scalar objects used by the paper's definition of static equilibrium. -/
structure StaticOutcome where
  /-- Wage `W`. -/
  wage : ℝ
  /-- Rental rate `R`. -/
  rental : ℝ
  /-- Unconstrained cost-minimizing threshold `tilde I`. -/
  unconstrainedThreshold : ℝ
  /-- Equilibrium automation threshold `I*`. -/
  automationThreshold : ℝ
  /-- Aggregate output `Y`. -/
  output : ℝ
  /-- Employment/labor supply `L`. -/
  labor : ℝ

/-- Equation (12), transcribed with real powers and the interval integral. -/
def Equation12Output (D : StaticModel) (E : StaticOutcome) : Prop :=
  let shat := effectiveElasticity D
  E.output =
    D.productivityScale / (1 - D.intermediateShare) *
      Real.rpow
        (Real.rpow
            (E.automationThreshold - D.newTaskFrontier + 1)
            (1 / shat) *
          Real.rpow D.capitalStock ((shat - 1) / shat) +
          Real.rpow
              (intervalIntegral.integral
                (fun i => Real.rpow (D.laborProductivity i) (shat - 1))
                E.automationThreshold D.newTaskFrontier)
              (1 / shat) *
            Real.rpow E.labor ((shat - 1) / shat))
        (shat / (shat - 1))

/-- Equations (6), (8)--(11), which define a static equilibrium in the paper. -/
def StaticEquilibrium (D : StaticModel) (E : StaticOutcome) : Prop :=
  let shat := effectiveElasticity D
  0 < E.wage ∧
    0 < E.rental ∧
    0 ≤ E.labor ∧
    0 ≤ E.output ∧
    E.wage / E.rental = D.laborProductivity E.unconstrainedThreshold ∧
    E.automationThreshold =
      min D.automationFrontier E.unconstrainedThreshold ∧
    Real.rpow D.productivityScale (shat - 1) *
          (1 - D.intermediateShare) * E.output *
          (E.automationThreshold - D.newTaskFrontier + 1) *
          Real.rpow E.rental (-shat) =
      D.capitalStock ∧
    Real.rpow D.productivityScale (shat - 1) *
          (1 - D.intermediateShare) * E.output *
          intervalIntegral.integral
            (fun i =>
              (1 / D.laborProductivity i) *
                Real.rpow (E.wage / D.laborProductivity i) (-shat))
            E.automationThreshold D.newTaskFrontier =
      E.labor ∧
    (E.automationThreshold - D.newTaskFrontier + 1) *
          Real.rpow E.rental (1 - shat) +
          intervalIntegral.integral
            (fun i =>
              Real.rpow (E.wage / D.laborProductivity i) (1 - shat))
            E.automationThreshold D.newTaskFrontier =
      Real.rpow D.productivityScale (1 - shat) ∧
    E.labor =
      D.laborSupply (E.wage / (E.rental * D.capitalStock))

/-- Cobb--Douglas output expression displayed in Corollary 1. -/
def Corollary1Output (D : StaticModel) (E : StaticOutcome) : Prop :=
  E.output =
    D.productivityScale / (1 - D.intermediateShare) *
      Real.rpow D.capitalStock
        (1 - D.newTaskFrontier + E.automationThreshold) *
      Real.rpow E.labor
        (D.newTaskFrontier - E.automationThreshold)

end AR18RaceManMachine
