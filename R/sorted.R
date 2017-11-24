#' Check Sorted
#' 
#' Checks whether object x is sorted.
#' 
#' Uses \code{!is.unsorted(x, na.rm = TRUE)} to test.
#' 
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_sorted(1:2, error = FALSE)
#' check_sorted(2:1, error = FALSE)
check_sorted <- function(x,
                         x_name = substitute(x),
                         error = TRUE) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)
  check_flag_internal(error)

  if (is.unsorted(x, na.rm = TRUE)) {
    on_fail(x_name, " must be sorted", error = error)
  }
  invisible(x)
}
