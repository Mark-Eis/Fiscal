\name{pers_allow}
\alias{pers_allow}
\alias{personal_allowance}
\title{Personal allowance calculator}
\description{
Calculates the standard Personal Allowance for a given adjusted net income.
}
\usage{
pers_allow(adj_net_income, opts = tax_opts())
}
\arguments{
  \item{adj_net_income}{\code{numeric}, adjusted net income.}
  
  \item{opts}{options, as created by \code{\link{tax_opts}()}, see details.}
}
\newcommand{\taxoptL}{£\Sexpr[stage=build]{prettyNum(with(Fiscal::tax_opts(), #1), ",")}}
\details{
The standard Personal Allowance is the amount of taxable income on which there is no tax liability,
currently \taxoptL{std_allow}.

The standard Personal Allowance  goes down by £1 for every £2 that
\href{https://www.gov.uk/guidance/adjusted-net-income}{adjusted net income} is above an upper
threshold, currently \taxoptL{allow_upper} and hence falls to zero if taxable income is
\taxoptL{allow_upper + 2 * std_allow} or above.

See GOV.UK \href{https://www.gov.uk/income-tax-rates}{Income Tax rates and Personal Allowances}.
}
\value{
A \code{numeric} vector representing values of the Personal Allowance.
}
\references{
\href{https://www.gov.uk/income-tax-rates}{Income Tax rates and Personal Allowances}

\href{https://www.gov.uk/guidance/adjusted-net-income}{Personal Allowances: adjusted net income}
}
\author{
\packageAuthor{Fiscal}
}

\seealso{

Other income_tax:
\code{\link{allowance}()},
\code{\link{incometax}()},
\code{\link{tax_opts}()}
}
\concept{income_tax}
\examples{

## Create a named ascending sequence of possible taxable incomes
## starting at upper threshold of the standard Personal Allowance
(newseq <-
    with(tax_opts(), seq(allow_upper, std_allow * 2 + allow_upper, length.out = 11)) |>
    setNames(nm = _)
)

## Calculate personal allowances on the basis of this sequence
pers_allow(newseq)

## Result is as expected
all.equal(pers_allow(newseq), with(tax_opts(), std_allow - (newseq - allow_upper) / 2))
}
