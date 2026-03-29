\name{tax_opts}
\alias{tax_opts}
\alias{tax_options}
\alias{income_tax_options}
\title{
Tax bands, rates and allowances
}
\description{
Options for tax bands, rates and allowances with default values for 2025-2027 tax years.
}
\usage{
tax_opts(
  band = c(37700L, 87439L),
  rate = c(0.2, 0.4, 0.45),
  std_allow = 12570L,
  allow_upper = 100000L
)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{band}{a \code{numeric} vector giving the width of the \emph{basic} and \emph{higher}
    rate bands.}
  
  \item{rate}{a \code{numeric} vector giving the \emph{basic}, \emph{higher} and \emph{additional}
    tax rates.}
  
  \item{std_allow}{the standard Personal Allowance.}
  
  \item{allow_upper}{upper income limit above which the standard allowance is reduced.}
}
\details{
Tax is paid on the amount of taxable income remaining after the Personal Allowance has been
deducted, allocated among the \emph{basic}, \emph{higher} and \emph{additional} rates.

Income exceeding the personal allowance by an amount up to and including the value of
\code{band[1]} attract \emph{basic rate} income tax; income exceeding the personal allowance plus
\code{band[1]} by an amount up to and including the value of \code{band[2]} attract
\emph{higher rate} income tax; and income exceeding the personal allowance plus the value of
\code{\link{sum}(band)} attract \emph{additional rate} income tax. See \code{\link{incometax}()}
\emph{Details} for further information.

Argument \code{allow_upper} is an income threshold above which the personal allowance goes down by
£1 for every £2 taxable income exceeds it, see GOV.UK
\href{https://www.gov.uk/income-tax-rates}{Income Tax rates and Personal Allowances}.

}

\value{
\code{tax_opts()} returns an object of class \code{"tax_opts"}, comprising a \code{list} of its
four arguments.
}
\references{
GOV.UK \href{https://www.gov.uk/government/publications/rates-and-allowances-income-tax/income-tax-rates-and-allowances-current-and-past}{Income Tax rates and allowances for current and previous tax years}
}
\author{
\packageAuthor{Fiscal}
}

\seealso{

Other income_tax:
\code{\link{allowance}()},
\code{\link{incometax}()},
\code{\link{pers_allow}()},
}
\concept{income_tax}
\examples{

tax_opts()

## Standard personal allowance
with(tax_opts(), std_allow)

## Upper income limit for every £2 above which the
## standard allowance is reduced by £1
with(tax_opts(), allow_upper)

## Typical income threshold for higher rate income tax
with(tax_opts(), sum(std_allow, band[1]))

## After personal allowance, amount above which
## additional rate income tax is payable
with(tax_opts(), sum(band[1], band[2]))

## Save hypothetical new rates as an object of class "tax_opts"
(newrates <- tax_opts(
    rate = c(0.19, 0.35, 0.43),
    std_allow = 14570,
    allow_upper = 102000))

## Use new rates in hypothetical tax estimations
incometax(120000,, newrates)

allowance(120000, 34015.35 + 6000,, newrates)

incometax(120000, -10370, newrates)
}
