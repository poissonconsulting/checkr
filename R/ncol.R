#' Check Number of Columns
#'
#' @param x The data to check.
#' @param ncol A count of the number of columns or a count range of the minimum and maximum number of columns.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_ncol(data.frame(x = 1), error = FALSE)
#' check_ncol(data.frame(x = 1:2), ncol = 1, error = FALSE)
check_ncol <- function(x, ncol = c(1L, 2147483647L),
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_count_range_internal(ncol)

  check_flag_internal(error)
  check_n(x, n = ncol(x), range = ncol, x_name = x_name, n_name = "column", error = error)
  invisible(x)
}
