allowance <-
function(taxable, deficit = NULL, opts = tax_opts()) {
	if (!inherits(opts, "tax_opts"))
		stop("! `opts` must be created by `tax_opts()`.", call. = FALSE)

	with(opts,
		{
			deficit <- deficit %||% sum(as.double(incometax(taxable)))
			if (deficit > band[1] * rate[1] + band[2] * rate[2])
				taxable - (band[1] + band[2] + (deficit - band[1] * rate[1] - band[2] * rate[2]) / rate[3])
			else
				if (deficit > band[1] * rate[1])
					taxable - (band[1] + (deficit - band[1] * rate[1]) / rate[2])
				else
					taxable - deficit / rate[1]		
		} - max(min(((sum(band) + 18 - taxable) / 2), 9), 0)		# fudge factor as for incometax()
	)
}
