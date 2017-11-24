#' Check Number of Columns
#'
#' @param x The data to check.
#' @param min_ncol A count of the minimum number of columns,
#' @param max_ncol A count of the maximum number of columns.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_ncol(data.frame(x = 1), error = FALSE)
#' check_ncol(data.frame(x = 1:2), max_ncol = 1, error = FALSE)
check_ncol <- function(x,
                         min_ncol = 1L,
                         max_ncol = 2147483647L,
                         x_name = substitute(x),
                         error = getOption("checkr.error", TRUE)) {
  x_name <- deparse_x_name(x_name)

  check_count_internal(min_ncol)
  check_count_internal(max_ncol)

  check_flag_internal(error)

  if (max_ncol < min_ncol) {
    error("max_ncol must not be less than min_ncol")
  }
  if (min_ncol == max_ncol) {
    if (ncol(x) != min_ncol) {
      on_fail(x_name, " must have ", min_ncol, plural(" column", min_ncol), error = error)
    }
    return(invisible(x))
  }

  if (ncol(x) < min_ncol) {
    on_fail(x_name, " must have at least ", min_ncol, plural(" column", min_ncol), error = error)
  }
  if (ncol(x) > max_ncol) {
    on_fail(x_name, " must not have more than ", max_ncol, plural(" column", max_ncol), error = error)
  }
  invisible(x)
}
