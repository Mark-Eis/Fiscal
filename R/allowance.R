allowance <-
function(taxable, deficit = NULL, round10 = TRUE, opts = tax_opts()) {
	if (!inherits(opts, "tax_opts"))
		stop("! `opts` must be created by `tax_opts()`.", call. = FALSE)

	with(opts,
		{
			deficit <- deficit %||% sum(as.double(incometax(taxable)))
			allow <- 
			if (deficit > band[1] * rate[1] + band[2] * rate[2])
				taxable - (band[1] + band[2] + (deficit - band[1] * rate[1] - band[2] * rate[2]) / rate[3])
			else
				if (deficit > band[1] * rate[1])
					taxable - (band[1] + (deficit - band[1] * rate[1]) / rate[2])
				else
					taxable - deficit / rate[1]
			offset <- if (allow < 0) 0 else 9
			allow <- allow - max(min(((sum(band) + 1 - taxable) / 2 + 9), offset), 0)		# adjustment as for incometax()		
            if (round10) round(allow, -1) else allow 
		}
	)
}
