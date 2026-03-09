\name{allowance}
\alias{allowance}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Personal tax allowance adjusted to recoup a tax deficit
}
\description{
Calculates the personal tax allowance adjusted in order to recoup a given amount of tax.
}
\usage{
allowance(taxable, deficit = NULL, opts = tax_opts())
}
\arguments{
  \item{taxable}{\code{numeric}, annual taxable income.}
  
  \item{deficit}{\code{numeric}, tax deficit to recoup, see details.}

  \item{opts}{options, as created by \code{\link{tax_opts}()}, see details.}
}
\details{
Income tax deficits are recouped by adjusting the Personal Allowance. \code{allowance()} calculates
the personal allowance required to recoup a specified amount of tax over the course of a year for a
given taxable income. The allowance calculated can be a negative amount, in which case it may be
referred to as a \emph{pay adjustment}.

Argument \code{deficit} represents the total amount of tax to recoup, including the usual amount
plus any additional outstanding deficit.

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

## Demonstrate that correct amount of £600, is recouped
incometax(12570, 9561)

####
## Tax deficit of £200 at salary within 20\% band 1
allowance(12570 + 1009, 200)

## This deficit is simply the usual amount of tax
incometax(12570 + 1009)

####
## Tax deficit of additional £600 at salary within 20\% band
allowance(12570 + 1009, 200 + 600)

## Demonstrate that correct additional amount of £600
## i.e., a tax total of £800, is recouped
incometax(12570 + 1009, 9570)

####
## Tax deficit of £7,940 at salary within 40\% band
allowance(12570 + 37700 + 1009, 7940)

## This deficit is simply the usual amount of tax
incometax(12570 + 37700 + 1009)

####
## Tax deficit of additional £600 at salary within 40\% band
allowance(12570 + 37700 + 1009, 7940 + 600)

## Demonstrate that correct additional amount of £600
## i.e., a tax total of £8,540, is recouped
incometax(12570 + 37700 + 1009, 11070)

####
## Tax deficit of £42,512.40 at salary within 40\% band
## (at the upper limit of the standard Personal Allowance)
allowance(125140, 42512.4)

## This deficit is simply the usual amount of tax
incometax(125140)

####
## Tax deficit of additional £600 at salary within 40\% band
## (at the upper limit of the standard Personal Allowance)
allowance(125140, 42512.4 + 600)

## Demonstrate that correct additional amount of £600
## i.e., a tax total of £43,112.40, is recouped
incometax(125140, -1325.222)

####
## Tax deficit of £47,016.05 at salary within 45\% band
## (above the upper limit of the Personal Allowance)
allowance(125140 + 10000, 47016.05)

## This deficit is simply the usual amount of tax
incometax(125140 + 10000)

####
## Tax deficit of additional £600 at salary within 45\% band
## (above the upper limit of the Personal Allowance)
allowance(125140 + 10000, 47016.05 + 600)

## Demonstrate that correct additional amount of £600
## i.e., a tax total of £47,616.05, is recouped
incometax(125140 + 10000, -1333.333)

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
