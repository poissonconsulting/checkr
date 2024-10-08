% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/join.R
\name{check_join}
\alias{check_join}
\title{Check Join}
\usage{
check_join(
  x,
  y,
  by = NULL,
  all_y = FALSE,
  x_name = substitute(x),
  y_name = substitute(y),
  error = TRUE
)
}
\arguments{
\item{x}{The object to check.}

\item{y}{The parent data frame.}

\item{by}{A character vector or named character vector of the columns to join by.}

\item{all_y}{A flag indicating whether all the rows in y should have a match in x.}

\item{x_name}{A string of the name of the object x.}

\item{y_name}{A string of the name of the object y.}

\item{error}{A flag indicating whether to throw an informative error or
immediately generate an informative message if the check fails.}
}
\value{
An invisible copy of x (if it doesn't throw an error).
}
\description{
Checks that the columns in data frame x form a many-to-one
join with the corresponding columns in y, ie,
the join is a unique key in y and all the rows in x have a match in y.
}
\examples{
data1 <- data.frame(x = 1:2)
data2 <- data.frame(x = 3:5, y = 2L)
check_join(data1, data2, error = FALSE)
check_join(data1, data2, by = c(x = "y"), error = FALSE)
}
\seealso{
\code{\link[=check_data]{check_data()}}
}
