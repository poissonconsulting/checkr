#' Check Sorted
#' 
#' Checks whether object x is sorted using `!is.unsorted(x, na.rm = TRUE)`.
#' 
#' @inheritParams params
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso [check_vector()] and [check_list()]
#' @export
#'
#' @examples
#' check_sorted(1:2, error = FALSE)
#' check_sorted(2:1, error = FALSE)
check_sorted <- function(x,
                         x_name = substitute(x),
                         error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_sorted()", "chk::chk_sorted()")
  x_name <- chk_deparse(x_name)

  check_flag_internal(error)

  is_unsorted <- is.unsorted(x, na.rm = TRUE)
  if (is.na(is_unsorted) || is_unsorted) {
    chk_fail(x_name, " must be sorted", error = error)
  }
  invisible(x)
}
