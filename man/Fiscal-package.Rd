\name{Fiscal-package}
\alias{Fiscal-package}
\alias{Fiscal}
\docType{package}
\title{
\packageTitle{Fiscal}
}
\description{
\packageDescription{Fiscal}
}
\details{
For one of life's only two certainties—for the other, the \CRANpkg{survival} package may be helpful.
}
\author{
\packageAuthor{Fiscal}

Maintainer: \packageMaintainer{Fiscal}
}
\references{
GOV.UK: --

\href{https://www.gov.uk/estimate-income-tax}{Estimate your Income Tax for the current year}

\href{https://www.gov.uk/government/publications/rates-and-allowances-income-tax/income-tax-rates-and-allowances-current-and-past#tax-rates-and-bands}{Income Tax rates and allowances for current and previous tax years}
}
\section{Disclaimer}{
While every effort is made to ensure this package functions as expected, the author accepts no responsibility for the consequences of errors.
}
\keyword{package}

%% Uncomment below to imitate parts of library(help = Fiscal)
%\section{The \file{DESCRIPTION} File}{\packageDESCRIPTION{Fiscal}}
%\section{Documentation Index}{\packageIndices{Fiscal}}

% \seealso{
%%  ~~ Optional links to other man pages, e.g. ~~
%%  ~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
% }
\examples{
## Calculate income tax for a range of salaries
incometax(12500)

incometax(25000)

incometax(75000)

incometax(125000)

incometax(150000)
}
