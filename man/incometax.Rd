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
  
  \item{allowance}{\code{numeric}, personal allowance or pay adjustment; see Details.}
  
  \item{opts}{options, as created by \code{\link{tax_opts}()}, see Details.}
  
  \item{x}{object of class \code{"incometax"} created by function \code{incometax()}.}
  
  \item{...}{further arguments passed to or from other methods.}
}
\details{
\code{incometax()} estimates income tax payable on PAYE earnings in England, Northern Ireland and
Wales, and is intended to replicate the estimates of GOV.UK
\href{https://www.gov.uk/estimate-income-tax}{Estimate your Income Tax for the current year}.

Tax is paid on the amount of taxable income remaining after the Personal Allowance has been
deducted, and is allocated among the \emph{basic}, \emph{higher} and \emph{additional} rate bands.
Earnings exceeding the personal allowance by an amount up to and including the upper limit of the
basic rate band attract \emph{basic rate} income tax; earnings exceeding the personal allowance plus
the basic rate band by an amount up to and including the upper limit of the higher rate band attract
\emph{higher rate} income tax; and earnings exceeding the personal allowance plus the sum of the
basic and higher rate bands attract \emph{additional rate} income tax.

The standard Personal Allowance is the amount of taxable income on which there is no tax liability,
currently £12,570. The personal allowance goes down by £1 for every £2 that
\href{https://www.gov.uk/guidance/adjusted-net-income}{adjusted net income} is above an upper
threshold, currently £100,000. This means the personal allowance is zero if taxable income is
£125,140 or above.

Hence currently in 2026: --
\itemize{
  \item taxable income exceeding the standard personal allowance (in the simplest case £12,570) by
    an amount up to £37,700 attracts 20\% basic rate income tax;
  \item taxable income up to £100,000 overall and exceeding the standard personal allowance by
    amounts between £37,701 and £87,430 attracts 40\% higher rate income tax;
  \item taxable income above £100,000 overall exceeding the reduced personal allowance by amounts
    between £87,430 and £125,140 attracts 40\% higher rate income tax; and
  \item taxable income above £125,140 has no personal allowance and attracts 45\% additional rate
    income tax.
}  
See GOV.UK 
\href{https://www.gov.uk/government/publications/rates-and-allowances-income-tax/income-tax-rates-and-allowances-current-and-past#tax-rates-and-bands}{Income Tax rates and allowances for current and previous tax years: Tax rates and bands}.

Argument \code{allowance} may be used to specify the
\href{https://www.gov.uk/income-tax-rates}{Personal Allowance}, or if negative, a
\href{https://www.gov.uk/tax-codes/k-in-your-tax-code}{K code pay adjustment}; otherwise, its
default value will be calculated using \code{\link{pers_allow}(income, opts)}.

Argument \code{opts} specifying values for tax bands, rates and allowances must be provided using
\code{\link{tax_opts}()}, which by default gives GOV.UK
\href{https://www.gov.uk/government/publications/rates-and-allowances-income-tax/income-tax-rates-and-allowances-current-and-past}{values for 2025-2027 tax years}.

}
\value{
\code{incometax()} returns an object of class \code{"incometax"} comprising a named \code{numeric}
vector of length three, with names derived from the three tax rates provided using
\code{\link{tax_opts}()} i.e., \code{c(20\%, 40\%, 45\%)} for the 2025-2027 tax years; and
\code{numeric} attributes \code{"allowance"} and \code{"taxable"}, representing the personal
allowance and tableable pay respectively.

\code{print()} and \code{format()} methods are provided for class \code{"incometax"}.
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
\code{incometax()} does not currently calculate \emph{National Insurance} (NI) contributions, and
should therefore return values equal to the estimates from the GOV.UK website
(\href{https://www.gov.uk/estimate-income-tax}{Estimate your Income Tax for the current year}) with
\dQuote{no} as the answer to the question \sQuote{Are you over the State Pension age?} For NI
information see:
\href{https://www.gov.uk/government/publications/rates-and-allowances-national-insurance-contributions/rates-and-allowances-national-insurance-contributions}{Rates and allowances: National Insurance contributions}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{

Other income_tax:
\code{\link{allowance}()},
\code{\link{pers_allow}()},
\code{\link{tax_opts}()}
}
\concept{income_tax}
\examples{
## Income equal to standard personal allowance
incometax(12570)

## Specifying standard personal allowance explicitly
all.equal(incometax(12570), incometax(12570, 12570))

## In practice, £9 is added to personal allowance
## before tax applied
incometax(12579)

all.equal(incometax(12579), incometax(12579, 12570))

## Base rate tax applied to earnings above personal allowance
incometax(12570 + 1009)

## ...up to base rate band limit
incometax(12570 + 37709)

## Higher rate applied to earnings above base rate band
incometax(12570 + 37700 + 1009)

## ...up to personal allowance limit of £100,000
incometax(100000)

## For every £2 of income above this limit,
## personal allowance decreases by £1
incometax(100000 + 4000)

incometax(100000 + 20000)

## Hence, at an income of £125,140,
## personal allowance is zero
incometax(125140)

## Above an income of £125,145
## additional rate tax is applied
incometax(125145)

incometax(125146)

incometax(125140 + 10000)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
