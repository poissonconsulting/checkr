#' Check Function
#' 
#' Checks if x is a function.
#' 
#' @inheritParams params
#' 
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
  x_name <- chk_deparse(x_name)
  
  check_length_internal(nargs)

  check_flag_internal(error)
  
  if (!is.function(x)) chk_fail(x_name, " must be a function", error = TRUE)
  
  check_n(x, n = length(formals(x)), range = nargs, x_name = x_name, n_name = "argument", error = error)
  
  invisible(x)
}
