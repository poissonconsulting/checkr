#' Check nlevels
#'
#' @param x The data to check.
#' @param nlevels A flag indicating whether x should have elements (versus no elements) or a missing value indicating no requirements or a count or count range of the number of elements.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_nlevels(factor(1), error = FALSE)
#' check_nlevels(factor(1), nlevels = 2, error = FALSE)
check_nlevels <- function(x,
                         nlevels = TRUE,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_length_internal(nlevels)

  check_flag_internal(error)
  check_n(x, n = nlevels(x), range = nlevels, x_name = x_name, n_name = "level", error = error)
  invisible(x)
}
