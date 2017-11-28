#' Check nlevels
#'
#' @param x The data to check.
#' @param nlevels A count of the number of rows or a count range of the minimum and maximum number of rows.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_nlevels(factor(1), error = FALSE)
#' check_nlevels(factor(1), nlevels = 2, error = FALSE)
check_nlevels <- function(x,
                         nlevels = c(1L, .Machine$integer.max),
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_count_range_internal(nlevels)

  check_flag_internal(error)
  check_n(x, n = nlevels(x), range = nlevels, x_name = x_name, n_name = "level", error = error)
  invisible(x)
}
