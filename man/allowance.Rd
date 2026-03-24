\name{allowance}
\alias{allowance}
\alias{adjustment}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Personal tax allowance adjusted to recoup a tax deficit
}
\description{
Calculates the personal tax allowance adjusted in order to recoup a given amount of tax.
}
\usage{
allowance(taxable, deficit = NULL, round10 = TRUE, opts = tax_opts())
}
\arguments{
  \item{taxable}{\code{numeric}, annual taxable income.}
  
  \item{deficit}{\code{numeric}, tax deficit to recoup, see details.}

  \item{round10}{\code{logical}, whether or not to round down return value to nearest £10; default \code{TRUE}.}

  \item{opts}{options, as created by \code{\link{tax_opts}()}, see details.}
}
\details{
Income tax deficits are recouped by adjusting the Personal Allowance. \code{allowance()} calculates
the personal allowance required to recoup a specified amount of tax over the course of a year for a
given taxable income. The allowance calculated can be a negative amount, in which case it may be
referred to as a \emph{pay adjustment}.

Argument \code{deficit} represents the total amount of tax to recoup, including the usual amount
of income tax as calculated by \code{\link{incometax}(taxable)}, plus the additional outstanding
tax deficit. If \code{round10 = TRUE}, as by default, the return value will be rounded down to the
nearest £10, in keeping with GOV.UK
\href{https://www.gov.uk/tax-codes/what-your-tax-code-means}{tax codes}. Rounding down ensures that,
if anything, tax is very slightly overpaid and not underpaid. Argument \code{opts} specifying values
for tax bands, rates and allowances must be provided using \code{\link{tax_opts}()}, which by
default gives GOV.UK
\href{https://www.gov.uk/government/publications/rates-and-allowances-income-tax/income-tax-rates-and-allowances-current-and-past}{values for 2025-2027 tax years}.
}
\value{
A \code{numeric}, representing value of the Personal Allowance or if negative, pay adjustment,
required to recoup the deficit.
}
\references{
GOV.UK: --
\itemize{
\item \href{https://www.gov.uk/income-tax-rates}{Personal Allowance}
\item \href{https://www.gov.uk/tax-codes/k-in-your-tax-code}{K code pay adjustment}
}
}
\author{
\packageAuthor{Fiscal}
}

\seealso{

Other income_tax:
\code{\link{incometax}()},
\code{\link{pers_allow}()},
\code{\link{tax_opts}()}

Vignette: \href{../doc/incometax.pdf}{PAYE income tax calculator for England, Northern Ireland and Wales}.
}
\concept{income_tax}
\examples{

###
## Personal Allowance to recoup a tax deficit

## An annual income of £13,579 i.e., £1,009 above the £12,570
## standard Personal Allowance, usually attracts £200 in income tax: –
incometax(13579)

## At this income, the Personal Allowance required 
## to recoup an additional £600 tax deficit is: –
allowance(13579, 200 + 600)

## Using this allowance, the additional amount of at least £600 tax
## is recouped as intended i.e., total income tax at least £800: –
incometax(13579, 9570)

###
## Pay Adjustment to recoup a tax deficit

## An annual income of £112,570, at which the standard Personal Allowance
## decreases by half, usually attracts £34,970.4 in income tax: –
incometax(112570)

## At this income, the pay adjustment required 
## to recoup an additional £3,500 tax deficit is: –
allowance(112570, 34970.4 + 3500)

## Using this pay adjustment, taxable income is adjusted to £115,030
## and the additional amount of at least £3,500 tax is recouped
## as intended i.e., total income tax at least £38,472:–
incometax(112570, -2460)

\dontrun{
###
## For further examples, see: -
	vignette("incometax")
}
}
