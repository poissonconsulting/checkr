#' Check nlevels
#' 
#' Checks the number of levels of an object.
#'
#' @inheritParams params
#' @param x The data to check.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_levels}} and \code{\link{check_vector}} 
#' @export
#'
#' @examples
#' check_nlevels(factor(1), error = FALSE)
#' check_nlevels(factor(1), nlevels = 2, error = FALSE)
check_nlevels <- function(x,
                         nlevels = TRUE,
                         x_name = substitute(x),
                         error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_nlevels()", "chk::check_dim()")
  x_name <- chk_deparse(x_name)

  check_length_internal(nlevels)

  check_flag_internal(error)
  check_n(x, n = nlevels(x), range = nlevels, x_name = x_name, n_name = "level", error = error)
  invisible(x)
}
