# Repository 6 - Acemoglu & Restrepo (2018)

**Daron Acemoglu and Pascual Restrepo.** *The Race between Man and Machine: Implications of Technology for Growth, Factor Shares, and Employment.* American Economic Review 108(6), 1488-1542.

[NBER working paper 22252](https://www.nber.org/papers/w22252) · [Published article](https://doi.org/10.1257/aer.20160696) · [Course issue](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/5)

This repository reads the NBER version revised in June 2017. The Lean workflow uses the same version. The NBER title puts “Machine” before “Man,” and its proposition pagination differs from the AER article.

## The question

**PAPER.** Can automation make labor redundant, or do price responses and the creation of new labor-intensive tasks generate a self-correcting race between the two technologies?

The paper replaces a two-factor production function with a continuum of tasks. Automation changes which tasks capital can perform. Reinstatement creates new tasks in which labor has a comparative advantage. This distinction lets productivity, wages, employment, and the labor share move in different directions.

## The agents' problems

Final output combines a unit measure of tasks, indexed by $i\in[N-1,N]$:

\[
Y=\widetilde B\left(\int_{N-1}^{N}y(i)^{\frac{\sigma-1}{\sigma}}\,di\right)^{\frac{\sigma}{\sigma-1}}.
\]

All tasks can use labor. Tasks $i\le I$ can also use capital. A competitive task producer chooses the cheaper effective input, so its unit cost is

\[
p(i)=
\begin{cases}
\min\{R,W/\gamma(i)\}^{1-\eta}, & i\le I,\\
(W/\gamma(i))^{1-\eta}, & i>I.
\end{cases}
\]

**PAPER.** Assumption 1 makes $\gamma(i)$ strictly increasing, so labor has comparative advantage in higher-index tasks. The cost threshold $\widetilde I$ solves $W/R=\gamma(\widetilde I)$, and the equilibrium automation threshold is

\[
I^*=\min\{I,\widetilde I\}.
\]

Capital performs tasks below $I^*$; labor performs tasks above it. In the endogenous-technology model, scientists choose between automation and new-task research. An interior balanced growth path requires equal innovation returns,

\[
\kappa_I v_I(n)=\kappa_N v_N(n), \qquad n=N-I.
\]

## Main result and all conditions

**PAPER, Proposition 6.** Impose:

- Assumption 1': $\gamma(i)=e^{Ai}$ with $A>0$;
- Assumption 2: either $\eta\to0$ or $\zeta=1$, which delivers the paper's closed-form homothetic factor demands;
- Assumption 4: $\widehat\sigma>\zeta$, so innovations that use the cheaper factor have positive value; and
- a sufficiently small scientist supply, $S<\overline S$, so growth is not too high and the local value-function approximation is valid.

Let $\overline\rho=B-\delta-\theta g$. When $\rho<\overline\rho$, there is a full-automation BGP with $n=0$ and every task produced by capital. When $\rho>\overline\rho$, every BGP has $n>\overline n(\rho)$, and there are thresholds $\overline\kappa\ge\underline\kappa>0$:

\[
\begin{array}{ccl}
\kappa_I/\kappa_N>\overline\kappa
&\Rightarrow& \text{a unique interior BGP},\\
\underline\kappa<\kappa_I/\kappa_N<\overline\kappa
&\Rightarrow& \text{multiple BGPs},\\
\kappa_I/\kappa_N<\underline\kappa
&\Rightarrow& \text{a unique no-automation BGP with }n=1.
\end{array}
\]

At the unique interior BGP, $n\in(\overline n(\rho),1)$ and $\kappa_Iv_I(n)=\kappa_Nv_N(n)$. If $\theta=0$, the equilibrium is globally saddle-path stable. If $\theta>0$, it is locally unique and asymptotically saddle-path stable.

**INTERPRETATION.** Stability comes from factor prices. More automation lowers the value of further automation and encourages new tasks; more reinstatement makes automation relatively attractive. The force is self-correcting only inside the interior region. Parameter changes can still move the economy to full automation, and a permanent rise in $\kappa_I/\kappa_N$ lowers the BGP values of $n$, employment, and the labor share.

## Does automation necessarily reduce wages?

No. In the static, technology-constrained region $I^*=I<\widetilde I$, Proposition 3 decomposes the wage response to marginal automation into productivity and displacement:

\[
\frac{d\ln W}{dI}
=
\underbrace{\frac{B^{\widehat\sigma-1}}{1-\widehat\sigma}
\left[\left(\frac{W}{\gamma(I^*)}\right)^{1-\widehat\sigma}-R^{1-\widehat\sigma}\right]}_{\text{productivity effect}}
-
\underbrace{(1-s_L)\frac{\Lambda_I}{\widehat\sigma+\varepsilon_L}}_{\text{displacement effect}}.
\]

**DERIVATION.** Automation raises the wage exactly when the first term exceeds the second. Equivalently, the cost saving from replacing labor at the marginal task is large enough to offset the loss of labor's task range. The paper proves that there is a capital threshold $\overline K>K$: wages rise for $K<\overline K$ and fall for $K>\overline K$. In the long run, on the interior BGP with $n>\overline n(\rho)$, capital accumulation pins down $R$, so more automation raises the long-run wage even while employment and the labor share fall.

## Repository contents

| Path | Contents |
|---|---|
| `prompts.md` | Raw prompts and relevant agent responses |
| `hand/` | Hand derivation and its short description |
| `presentation.tex` / `presentation.pdf` | 20-minute Beamer presentation |
| `analysis/` | Reproducible analytical and computational checks |
| `lean/` | Complete `AR18RaceManMachine` output copied from this repository's own AppliedModelingLib run |
| `lean-check.txt` | Recorded paper-scoped workflow check |
| `paper/README.md` | Exact source version and local retrieval instructions |

