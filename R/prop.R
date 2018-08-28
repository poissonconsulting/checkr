#' Check Proportion
#' 
#' Checks if x is a proportion (non-missing dbl between 0 and 1 inclusive with no attributes including names).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce an integer to a dbl and drop attributes including names.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_number}} and \code{\link{check_scalar}}
#' @export
#'
#' @examples
#' check_prop(1, error = FALSE)
#' check_prop(1.1, error = FALSE)
#' check_prop(c(0, 1), error = FALSE)
check_prop <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce) {
    attributes(x) <- NULL
    if(is.integer(x))
      x <- as.numeric(x)
  }
  check_scalar(x, values = c(0,1), x_name = x_name, error = error)
}

#' @rdname check_prop
#' @export
check_probability <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  .Deprecated("check_prop")
  x_name <- deparse_x_name(x_name)

  check_prop(x, coerce = coerce, x_name = x_name, error = error)
}

