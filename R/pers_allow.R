pers_allow <-
function(adj_net_income, opts = tax_opts()) {
	with(opts, 
		ifelse(
			adj_net_income > allow_upper,
			std_allow - (adj_net_income - allow_upper) / 2,
			std_allow
		) |>
		pmax(0)
	)
}
