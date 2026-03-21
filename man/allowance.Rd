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
referred to as a \emph{Pay Adjustment}.

Argument \code{deficit} represents the total amount of tax to recoup, including the usual amount
plus any additional outstanding deficit.

Argument \code{round10}, if \code{TRUE}, the default, causes the return value to be rounded down to
the nearest £10, in keeping with GOV.UK
\href{https://www.gov.uk/tax-codes/what-your-tax-code-means}{tax codes}. Rounding down ensures that
if anything, tax is very slightly overpaid, not underpaid.

Argument \code{opts} specifying values for tax bands, rates and allowances must be provided using
\code{\link{tax_opts}()}, which by default gives GOV.UK
\href{https://www.gov.uk/government/publications/rates-and-allowances-income-tax/income-tax-rates-and-allowances-current-and-past}{values for 2025-2027 tax years}.
}
\value{
A \code{numeric}, representing value of the Personal Allowance or if negative, Pay Adjustment,
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
% \note{
%%  ~~further notes~~
% }

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{

Other income_tax:
\code{\link{incometax}()},
\code{\link{pers_allow}()},
\code{\link{tax_opts}()}
}
\concept{income_tax}
\examples{

####
## Tax deficit of £600 at salary no more
## than the standard personal allowance
allowance(12570, 600)

## Demonstrate that the intended amount
## of at least £600 tax is recouped
incometax(12570, 9560)

####
## Tax deficit of £200 at salary within 20\% band 1
allowance(12570 + 1009, 200)

## This deficit is simply the usual amount of tax
incometax(12570 + 1009)

####
## Tax deficit of additional £600 at salary within 20\% band
allowance(12570 + 1009, 200 + 600)

## Demonstrate that the intended additional
## amount of at least £600 tax is recouped
## i.e., a total of at least £800
incometax(12570 + 1009, 9570)

####
## Tax deficit of £7,940 at salary within 40\% band
allowance(12570 + 37700 + 1009, 7940)

## This deficit is simply the usual amount of tax
incometax(12570 + 37700 + 1009)

####
## Tax deficit of additional £600 at salary within 40\% band
allowance(12570 + 37700 + 1009, 7940 + 600)

## Demonstrate that the intended additional
## amount of at least £600 tax is recouped
## i.e., a total of at least £8,540
incometax(12570 + 37700 + 1009, 11070)

####
## Tax deficit of £42,512.40 at salary within 40\% band
## (above the upper limit of the Personal Allowance)
allowance(125140, 42512.4)

## This deficit is simply the usual amount of tax
incometax(125140)

####
## Tax deficit of additional £600 at salary within 40\% band
## (above the upper limit of the Personal Allowance)
allowance(125140, 42512.4 + 600)

## Demonstrate that the intended additional
## amount of at least £600 tax is recouped
## i.e., a total of at least £43,112.40
incometax(125140, -1330)

####
## Tax deficit of £47,015.6 at salary within 45\% band
## (above the upper limit of the Personal Allowance)
allowance(135139, 47015.6)

## This deficit is simply the usual amount of tax
incometax(135139)

####
## Tax deficit of additional £600 at salary within 45\% band
## (above the upper limit of the Personal Allowance)
allowance(135139, 47015.6 + 600)

## Demonstrate that the intended additional
## amount of at least £600 tax is recouped
## i.e., a total of at least £47,615.6
incometax(135139, -1340)

}
