#' Check Scalar
#' 
#' Checks whether an object is an atomic vector with one element.
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_vector}}
#' @export
#'
check_scalar <- function(x,
                         x_name = substitute(x),
                         error = TRUE) {
  
  .Deprecated("check_length1()")
  # replace with check_scalar that includes checking of class (as more commonly required)
  x_name <- deparse_x_name(x_name)

  if (!is.atomic(x)) error(x_name, " must be an atomic vector")

  check_length(x, x_name = x_name, length = 1, error = error)
  check_unnamed(x, x_name = x_name, error = error)
  invisible(x)
}
