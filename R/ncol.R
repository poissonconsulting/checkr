#' Check Number of Columns
#'
#' @inheritParams check_length
#' @param ncol A flag indicating whether x should have columns (versus no columns) or a missing value indicating no requirements or a count or count range of the number of columns.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_ncol(data.frame(x = 1), error = FALSE)
#' check_ncol(data.frame(x = 1:2), ncol = 1, error = FALSE)
check_ncol <- function(x, ncol = TRUE,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_length_internal(ncol)

  check_flag_internal(error)
  check_n(x, n = ncol(x), range = ncol, x_name = x_name, n_name = "column", error = error)
  invisible(x)
}
