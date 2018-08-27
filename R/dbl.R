#' Check Dbl
#' 
#' Checks if x is a dbl (non-missing numeric scalar).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a scalar integer to a dbl.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_scalar}}
#' @export
#'
#' @examples
#' check_dbl(1, error = FALSE)
#' check_dbl(1L, error = FALSE)
#' check_dbl(c(1,2), error = FALSE)
check_dbl <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)


  check_flag_internal(coerce)
  check_flag_internal(error)

  if(coerce && is.numeric(x)) {
    x <- as.numeric(x)     
  }
  
  check_scalar(x, values = 1, x_name = x_name, error = error)
}