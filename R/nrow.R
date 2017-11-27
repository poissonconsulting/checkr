#' Check nrow
#'
#' @param x The data to check.
#' @param nrow A count or count range of the number of rows.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_nrow(data.frame(x = 1), error = FALSE)
#' check_nrow(data.frame(x = integer(0)), error = FALSE)
#' check_nrow(data.frame(x = 1:2), nrow = 1, error = FALSE)
check_nrow <- function(x, nrow = c(1L, 2147483647L),
                         x_name = substitute(x),
                         error = getOption("checkr.error", TRUE)) {
  x_name <- deparse_x_name(x_name)

  check_count_range_internal(nrow)

  check_flag_internal(error)
  
  check_n(x, n = nrow(x), range = nrow, x_name = x_name, n_name = "row", error = error)
  invisible(x)
}
