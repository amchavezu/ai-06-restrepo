# Computational check: the wage decomposition

`wage_decomposition.py` evaluates the marginal wage formula in Proposition 3 while varying the effective labor-to-capital cost ratio at the marginal automated task,

\[
c=\frac{W/\gamma(I^*)}{R}>1.
\]

This is a numerical evaluation of the proposition's decomposition, not a calibration and not a simulation of the full dynamic equilibrium. The script normalizes $R=1$, reports the productivity and displacement terms separately, and solves the exact break-even cost ratio for the chosen illustrative parameters.

Run from the repository root:

```bash
python analysis/wage_decomposition.py
```

The committed `wage_decomposition.csv` is the reproducible input used by the presentation.

