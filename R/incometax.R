incometax <-
function(income, allowance = NULL, opts = tax_opts()) {
	if (!inherits(opts, "tax_opts"))
		stop("! `opts` must be created by `tax_opts()`.", call. = FALSE)

	with(opts,
	{
		allowance <- allowance %||% pers_allow(income, opts)
		taxable <- max(income - allowance, 0)
		offset <- if (allowance < 0) 0 else 9
		taxablef <- max(taxable - max(min(((sum(band) - income) / 2 + 9), offset), 0), 0) # adjustment
		if (taxablef >= band[1] + band[2]) {
			band[2] <- band[2] - 1
			c(band[1] * rate[1], band[2] * rate[2], (taxablef - band[1] - band[2]) * rate[3])
		} else
			if (taxablef > band[1])
				c(band[1] * rate[1], (taxablef - band[1]) * rate[2], 0)
			else
				if (taxablef > 0)
					c(taxablef * rate[1], 0, 0)
				else c(0, 0, 0)
	} |>
	round(2) |>
	setNames(paste0(c(rate[1], rate[2], rate[3]) * 100, "%")) |>
	structure(class = "incometax", allowance = allowance, taxable = taxable, adjusted = allowance < 0))
}


format.incometax <-
function(x, ...) {
	tmp <- prettyL(x)
	len <- nchar(tmp)
	maxlen <- max(max(len), 3)
	cat("Rate:", paste0(paste0(rep(" ", maxlen - 2), collapse = ""), names(x), collapse = ""),
		"\nTax: ", paste0(paste(lapply(maxlen - len + 1, \(x) paste0(rep(" ", x), collapse = ""))), tmp, collapse = ""),
		"\nTotal tax: ", prettyL(sum(x)),
		"\nAllowance: ", prettyL(attr(x, "allowance")),
		"\nTaxable:   ", prettyL(attr(x, "taxable")), "\n\n")
}


print.incometax <-
function(x, ...) {
	format(x)
	invisible(x)
}

# Not exported
prettyL <- function(x) paste0("\U00A3", prettyNum(x, ","))
