#' Check nrow
#'
#' @param x The data to check.
#' @param min_nrow A count of the minimum number of rows.
#' @param max_nrow A count of the maximum number of rows.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_nrow(data.frame(x = 1), error = FALSE)
#' check_nrow(data.frame(x = integer(0)), error = FALSE)
#' check_nrow(data.frame(x = 1:2), max_nrow = 1, error = FALSE)
check_nrow <- function(x,
                         min_nrow = 1L,
                         max_nrow = 2147483647L,
                         x_name = substitute(x),
                         error = getOption("checkr.error", TRUE)) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_count_internal(min_nrow)
  check_count_internal(max_nrow)

  check_string_internal(x_name)
  check_flag_internal(error)

  if (max_nrow < min_nrow) {
    error("max_nrow must not be less than min_nrow")
  }
  if (min_nrow == max_nrow) {
    if (nrow(x) != min_nrow) {
      on_fail(x_name, " must have ", min_nrow, plural(" row", min_nrow), error = error)
    }
    return(invisible(x))
  }

  if (nrow(x) < min_nrow) {
    on_fail(x_name, " must have at least ", min_nrow, plural(" row", min_nrow), error = error)
  }
  if (nrow(x) > max_nrow) {
    on_fail(x_name, " must not have more than ", max_nrow, plural(" row", max_nrow), error = error)
  }
  invisible(x)
}
