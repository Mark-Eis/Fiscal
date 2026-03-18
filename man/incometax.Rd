\name{incometax}
\alias{incometax}
\alias{income_tax}
\alias{format.incometax}
\alias{print.incometax}
\title{Income tax calculator}
\description{PAYE income tax calculator for England, Northern Ireland and Wales.}
\usage{
incometax(income, allowance = NULL, opts = tax_opts())

\method{format}{incometax}(x, ...)

\method{print}{incometax}(x, ...)
}
\arguments{
  \item{income}{\code{numeric}, annual taxable income.}
  
  \item{allowance}{\code{numeric}, Personal Allowance or pay adjustment; see Details.}
  
  \item{opts}{options, as created by \code{\link{tax_opts}()}, see Details.}
  
  \item{x}{object of class \code{"incometax"} created by function \code{incometax()}.}
  
  \item{...}{further arguments passed to or from other methods.}
}

\newcommand{\taxoptL}{£\Sexpr[stage=build]{prettyNum(with(Fiscal::tax_opts(), #1), ",")}}
\newcommand{\taxoptpc}{\Sexpr[stage=build]{with(Fiscal::tax_opts(), #1 * 100)}}
\details{
\code{incometax()} estimates income tax payable on PAYE income in England, Northern Ireland and
Wales, and is intended to replicate the estimates of GOV.UK
\href{https://www.gov.uk/estimate-income-tax}{Estimate your Income Tax for the current year}.

Tax is paid on the amount of taxable income remaining after the
\href{https://www.gov.uk/income-tax-rates}{Personal Allowance} has been deducted, and is allocated
among the \emph{basic}, \emph{higher} and \emph{additional} rates. After deduction of the Personal
Allowance, if any (see below): income up to and including the upper limit of the basic rate band
attracts \emph{basic rate} tax; income exceeding the basic rate band by an amount up to and 
including the upper limit of the higher rate band attracts \emph{higher rate} tax; and income
exceeding the sum of the basic and higher rate bands attracts \emph{additional rate} tax.

The \href{https://www.gov.uk/income-tax-rates}{standard Personal Allowance} is the amount of taxable
income on which there is no tax liability, currently \taxoptL{std_allow}. The Personal Allowance
goes down by £1 for every £2 that
\href{https://www.gov.uk/guidance/adjusted-net-income}{adjusted net income} is above an upper
threshold, currently \taxoptL{allow_upper}. This means the Personal Allowance is zero if taxable
income is \taxoptL{allow_upper + 2 * std_allow} or above.

Hence currently in 2026: --
\itemize{
 \item taxable income after allowances---e.g., the standard Personal Allowance of 
    \taxoptL{std_allow}---up to \taxoptL{band[1]} attracts \taxoptpc{rate[1]}\% basic rate income
    tax;
  \item taxable income after allowances between \taxoptL{band[1] + 1} and \taxoptL{sum(band)}
    attracts \taxoptpc{rate[2]}\% higher rate income tax---noting that the standard Personal
    Allowance is reduced above \taxoptL{allow_upper}; and
  \item taxable income after allowances above \taxoptL{sum(band)} attracts \taxoptpc{rate[3]}\%
    additional rate income tax---noting there is no standard Personal Allowance at or above
    \taxoptL{allow_upper + 2 * std_allow}.
}
See GOV.UK 
\href{https://www.gov.uk/government/publications/rates-and-allowances-income-tax/income-tax-rates-and-allowances-current-and-past#tax-rates-and-bands}{Income Tax rates and allowances for current and previous tax years: Tax rates and bands}.

Argument \code{allowance} may be used to specify a bespoke Personal Allowance, or if negative, a
\href{https://www.gov.uk/tax-codes/k-in-your-tax-code}{K code pay adjustment}; otherwise, its
default value will be calculated using \code{\link{pers_allow}(income, opts)}.

Argument \code{opts} specifying values for tax bands, rates and allowances must be provided using
\code{\link{tax_opts}()}, which by default gives GOV.UK
\href{https://www.gov.uk/government/publications/rates-and-allowances-income-tax/income-tax-rates-and-allowances-current-and-past}{values for 2025-2027 tax years}.

\code{\link{print}()} and \code{\link{format}()} methods are provided for class \code{"incometax"}, see Value.
}
\value{
\code{incometax()} returns an object of class \code{"incometax"} comprising a named \code{numeric}
vector of length three, with names derived from the three tax rates provided using
\code{\link{tax_opts}()} i.e., \code{\taxoptpc{rate[1]}\%, \taxoptpc{rate[2]}\% and \taxoptpc{rate[3]}\%} for the 2025-2027 tax years; and
\code{numeric} attributes \code{"allowance"} and \code{"taxable"}, representing the personal
allowance and tableable pay respectively.
}
\references{
GOV.UK: --
\itemize{
\item \href{https://www.gov.uk/estimate-income-tax}{Estimate your Income Tax for the current year}
\item \href{https://www.gov.uk/income-tax-rates}{Personal Allowance}
\item \href{https://www.gov.uk/tax-codes}{Tax codes}
}
}
\author{
\packageAuthor{Fiscal}
}
\note{
\enumerate{
\item In practice, an additional £9 income is allowed before basic and higher rate tax is applied.
\item An additional £6 income is allowed before additional rate tax is applied; the additional £6 is
decreased by £1 for every further £2 increase in income beyond \taxoptL{sum(band) + 7}.
\item \code{incometax()} does not currently calculate \emph{National Insurance} (NI) contributions, and
should therefore return values equal to the estimates from the GOV.UK website
(\href{https://www.gov.uk/estimate-income-tax}{Estimate your Income Tax for the current year}) with
\dQuote{no} as the answer to the question \sQuote{Are you over the State Pension age?} For NI
information see:
\href{https://www.gov.uk/government/publications/rates-and-allowances-national-insurance-contributions/rates-and-allowances-national-insurance-contributions}{Rates and allowances: National Insurance contributions}.
}
}

\seealso{

Other income_tax:
\code{\link{allowance}()},
\code{\link{pers_allow}()},
\code{\link{tax_opts}()}

Vignette: \href{../doc/incometax.pdf}{PAYE income tax calculator for England, Northern Ireland and Wales}.
}
\concept{income_tax}
\examples{
## Up to the standard Personal Allowance,
## income attracts no tax 
incometax(12570)

## After the standard Personal Allowance,
## income attracts base rate tax
incometax(12570 + 1009)

## After the standard Personal Allowance, income above
## the the base rate band attracts higher rate tax
incometax(12570 + 37700 + 1009)

## Income above the base and higher rate
## bands attracts additional rate tax
incometax(37700 + 87439 + 10000)

## For every £2 of income above its £100,000 upper limit,
## the standard Personal Allowance decreases by £1
incometax(100000 + 20000)

## At an income of £125,140 or above,
## Personal Allowance is zero
incometax(125140)

## Specify a bespoke Personal Allowance
## explicitly using the second argument
incometax(6570 + 10009, 6570)

## Specify a pay adjustment using
## a negative second argument
incometax(125139, -10000)
}
