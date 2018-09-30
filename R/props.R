#' Check Proportions
#' 
#' Checks if x is proportions vector - non-missing dbls between 0 and 1 that sum to 1.
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_prop}} and \code{\link{check_vector}}
#' @export
#'
#' @examples
#' check_props(1, error = FALSE)
#' check_props(1.1, error = FALSE)
#' check_props(c(0, 1), error = FALSE)
check_props <- function(x, x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(error)
  
  check_vector(x, values = c(0,1), x_name = x_name, error = error)
  if(sum(x) != 1) {
    on_fail("values of ", x_name, " must sum to 1 (not ", sum(x),")", error = error)
  }
  invisible(x)
}