#' Check Function
#' 
#' Checks if x is a function.
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param nargs A count of the number of arguments or count range of the minimum and maximum number of arguments.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_function(character, error = FALSE)
#' check_function(character, nargs = 0L, error = FALSE)
check_function <- function(x, 
                           nargs = NA,
                           x_name = substitute(x),
                           error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_length_internal(nargs)

  check_flag_internal(error)
  
  if (!is.function(x)) on_fail(x_name, " must be a function", error = TRUE)
  
  check_n(x, n = length(formals(x)), range = nargs, x_name = x_name, n_name = "argument", error = error)
  
  invisible(x)
}
