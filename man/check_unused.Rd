% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/unused.R
\name{check_unused}
\alias{check_unused}
\title{Check Unused}
\usage{
check_unused(..., x_name = "...", error = TRUE)
}
\arguments{
\item{...}{The arguments to check.}

\item{x_name}{A string of the name of the object x.}

\item{error}{A flag indicating whether to throw an informative error or
immediately generate an informative message if the check fails.}
}
\value{
An invisible copy of x (if it doesn't throw an error).
}
\description{
Checks whether ... is unused. It can only be used in functions.
}
\examples{
fun <- function(...) check_unused(..., error = FALSE)
fun()
fun(1)
}
