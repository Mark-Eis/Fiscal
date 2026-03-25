# Fiscal devel. (2026-03-25)

* Proof and correct documentation (#19).

* Correct `\VignetteIndexEntry` in incometax.Rnw (#19).

# Fiscal 1.0.1 (2026-03-24)

* Update `allowance()` documentation (#21).

* Add arg `round10` to `allowance()`, when `TRUE` (default) to round down return value to nearest £10 (#20).

* Proof and correct documentation (#19).

* Revised `format.incometax()` headings to be more consistent with GOV.UK website (#18).

* Improved `pers_allow()` examples (#17).

* Uses `Sexpr` macros in Rd files to encode current values of `tax_opts()` (#15).

* `band[2]` in `tax_opts()` revised to £87,439 allowing simplified code in `incometax.R` and `allowance.R` (#13).

* Replaced "earnings" by "income" throughout documentation (#12).

* Improved `incometax()` documentation including links to {base} generic `format()` and `print()` functions (#11).

* Simplified `incometax()` examples and vignette "incometax" created for more complex ones (#7).

# Fiscal 1.0.0 (2026-03-09)

* Initial CRAN submission.
