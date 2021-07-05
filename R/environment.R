#' Check Environment
#' 
#' Checks if x is an environment.
#'
#' @inheritParams params
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_environment(1, error = FALSE)
#' check_environment(.GlobalEnv, error = FALSE)
check_environment <- function(x, 
                           x_name = substitute(x),
                           error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_environment()", "chk::chk_environment()")
  x_name <- chk_deparse(x_name)
  check_flag_internal(error)
  
  if (!is.environment(x)) chk_fail(x_name, " must be an environment", error = error)

  invisible(x)
}
