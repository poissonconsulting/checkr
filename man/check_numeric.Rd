% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/numeric.R
\name{check_numeric}
\alias{check_numeric}
\alias{check_double}
\title{Check Numeric}
\usage{
check_numeric(x, coerce = FALSE, x_name = substitute(x), error = TRUE)

check_double(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
}
\arguments{
\item{x}{The object to check.}

\item{coerce}{A flag indicating whether to coerce a integer vector to an double vector and drop attributes including names.}

\item{x_name}{A string of the name of the object x.}

\item{error}{A flag indicating whether to throw an informative error or
immediately generate an informative message if the check fails.}
}
\value{
An invisible copy of x (if it doesn't throw an error).
}
\description{
Checks if x is an numeric (double) vector with no attributes including names.
}
\examples{
check_numeric(1, error = FALSE)
check_numeric(1L, error = FALSE)
check_numeric(1:2, error = FALSE)
}
\seealso{
\code{\link[=check_number]{check_number()}}
}
