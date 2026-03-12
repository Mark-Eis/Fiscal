tax_opts <-
function(
	band = c(37700L, 87439L),
	rate = c(0.2, 0.4, 0.45),
	std_allow = 12570L,
	allow_upper = 1e5L
	) {
	structure(
		list(
			band = band,
			rate = rate,
			std_allow = std_allow,
			allow_upper = allow_upper
		),
		class = "tax_opts"
	)
}
