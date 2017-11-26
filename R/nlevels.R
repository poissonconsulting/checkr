#' Check nlevels
#'
#' @param x The data to check.
#' @param min_nlevels A count of the minimum number of rows.
#' @param max_nlevels A count of the maximum number of rows.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_nlevels(factor(1), error = FALSE)
#' check_nlevels(factor(1), min_nlevel = 2, error = FALSE)
check_nlevels <- function(x,
                         min_nlevels = 1L,
                         max_nlevels = 2147483647L,
                         x_name = substitute(x),
                         error = getOption("checkr.error", TRUE)) {
  x_name <- deparse_x_name(x_name)

  check_count_internal(min_nlevels)
  check_count_internal(max_nlevels)

  check_flag_internal(error)

  if (max_nlevels < min_nlevels) {
    error("max_nlevels must not be less than min_nlevels")
  }
  if (min_nlevels == max_nlevels) {
    if (nlevels(x) != min_nlevels) {
      on_fail(x_name, " must have ", min_nlevels, plural(" level", min_nlevels), error = error)
    }
    return(invisible(x))
  }

  if (nlevels(x) < min_nlevels) {
    on_fail(x_name, " must have at least ", min_nlevels, plural(" level", min_nlevels), error = error)
  }
  if (nlevels(x) > max_nlevels) {
    on_fail(x_name, " must not have more than ", max_nlevels, plural(" level", max_nlevels), error = error)
  }
  invisible(x)
}
