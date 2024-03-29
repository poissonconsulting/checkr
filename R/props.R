#' Check Proportions
#'
#' Checks if x is proportions vector - non-missing dbls between 0 and 1 that sum
#' to 1.
#'
#' @inheritParams params
#'
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
check_props <- function(x, x_name = substitute(x),
                       error = TRUE) {
  lifecycle::deprecate_soft(
    "0.5.1", 
    "check_props()", 
    NULL,
    "Use chk::chk_range() and then chk::chk_equal(sum(x), 1) instead.")
  x_name <- chk_deparse(x_name)

  check_flag_internal(error)
  
  check_vector(x, values = c(0,1), x_name = x_name, error = error)
  if(sum(x) != 1) {
    chk_fail("values of ", x_name, " must sum to 1 (not ", sum(x),")", error = error)
  }
  invisible(x)
}