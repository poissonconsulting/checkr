#' Check Environment
#' 
#' Checks if x is an environment.
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_environment(1, error = FALSE)
#' check_environment(.GlobalEnv, error = FALSE)
check_environment <- function(x, 
                           x_name = substitute(x),
                           error = TRUE) {
  x_name <- deparse_x_name(x_name)
  check_flag_internal(error)
  
  if (!is.environment(x)) chk_fail(x_name, " must be an environment", error = error)

  invisible(x)
}
