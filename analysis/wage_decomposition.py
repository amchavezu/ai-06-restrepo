"""Numerical check of Proposition 3's marginal wage decomposition.

This script does not calibrate the paper. It evaluates the exact comparative-
static formula after normalizing the rental rate R to one.
"""

from __future__ import annotations

import csv
import math
from pathlib import Path


# Illustrative parameters. They satisfy hat_sigma > 1 and all displayed
# quantities are positive. They are not empirical estimates.
B = 1.0
HAT_SIGMA = 1.5
LABOR_SHARE = 0.60
LABOR_SUPPLY_ELASTICITY = 0.50
LAMBDA_I = 2.0
RENTAL_RATE = 1.0


def productivity_effect(cost_ratio: float) -> float:
    """Coefficient on dI in d ln Y holding K and L fixed."""
    effective_wage = cost_ratio * RENTAL_RATE
    exponent = 1.0 - HAT_SIGMA
    return (B ** (HAT_SIGMA - 1.0) / exponent) * (
        effective_wage**exponent - RENTAL_RATE**exponent
    )


def displacement_effect() -> float:
    """Positive magnitude of the displacement term in d ln W / dI."""
    return (
        (1.0 - LABOR_SHARE)
        * LAMBDA_I
        / (HAT_SIGMA + LABOR_SUPPLY_ELASTICITY)
    )


def break_even_ratio() -> float:
    """Solve analytically for the cost ratio at which d ln W / dI = 0."""
    exponent = 1.0 - HAT_SIGMA
    target = (
        1.0
        + displacement_effect()
        * exponent
        / (B ** (HAT_SIGMA - 1.0) * RENTAL_RATE**exponent)
    )
    if target <= 0:
        raise ValueError("The illustrative parameters have no positive break-even ratio")
    return target ** (1.0 / exponent)


def main() -> None:
    ratios = [1.01, 1.10, 1.25, 1.50, 1.5625, 1.75, 2.00, 3.00, 4.00]
    displacement = displacement_effect()
    rows = []
    for ratio in ratios:
        productivity = productivity_effect(ratio)
        net = productivity - displacement
        rows.append(
            {
                "effective_cost_ratio": f"{ratio:.4f}",
                "productivity_effect": f"{productivity:.6f}",
                "displacement_effect": f"{displacement:.6f}",
                "net_dlog_wage_per_dI": f"{net:.6f}",
                "wage_response": (
                    "zero"
                    if math.isclose(net, 0.0, abs_tol=1e-12)
                    else "increase"
                    if net > 0
                    else "decrease"
                ),
            }
        )

    output = Path(__file__).with_name("wage_decomposition.csv")
    with output.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.DictWriter(stream, fieldnames=rows[0].keys())
        writer.writeheader()
        writer.writerows(rows)

    threshold = break_even_ratio()
    assert math.isclose(threshold, 1.5625, rel_tol=1e-12)
    print(f"break-even effective cost ratio: {threshold:.4f}")
    print(f"wrote {len(rows)} rows to {output}")


if __name__ == "__main__":
    main()
