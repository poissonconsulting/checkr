% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dbl.R
\name{check_dbl}
\alias{check_dbl}
\alias{check_number}
\title{Check Dbl}
\usage{
check_dbl(x, coerce = FALSE, x_name = substitute(x), error = TRUE)

check_number(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
}
\arguments{
\item{x}{The object to check.}

\item{coerce}{A flag indicating whether to coerce a scalar integer to a dbl and drop attributes including names.}

\item{x_name}{A string of the name of the object x.}

\item{error}{A flag indicating whether to throw an informative error or
immediately generate an informative message if the check fails.}
}
\value{
An invisible copy of x (if it doesn't throw an error).
}
\description{
Checks if x is a dbl (non-missing numeric scalar with no attributes including names).
}
\examples{
check_dbl(1, error = FALSE)
check_dbl(1L, error = FALSE)
check_dbl(c(1,2), error = FALSE)
}
\seealso{
\code{\link[=check_scalar]{check_scalar()}}
}
