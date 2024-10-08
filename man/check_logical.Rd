% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/logical.R
\name{check_logical}
\alias{check_logical}
\title{Check Logical}
\usage{
check_logical(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
}
\arguments{
\item{x}{The object to check.}

\item{coerce}{A flag indicating whether to drop attributes including names.}

\item{x_name}{A string of the name of the object x.}

\item{error}{A flag indicating whether to throw an informative error or
immediately generate an informative message if the check fails.}
}
\value{
An invisible copy of x (if it doesn't throw an error).
}
\description{
Checks if x is a logical vector with no attributes including names.
}
\examples{
check_logical(1, error = FALSE)
check_logical(FALSE, error = FALSE)
check_logical(c(FALSE, TRUE), error = FALSE)
}
\seealso{
\code{\link[=check_scalar]{check_scalar()}}
}
