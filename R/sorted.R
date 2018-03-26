#' Check Sorted
#' 
#' Checks whether object x is sorted using \code{!is.unsorted(x, na.rm = TRUE)}.
#' 
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_vector}} and \code{\link{check_list}}
#' @export
#'
#' @examples
#' check_sorted(1:2, error = FALSE)
#' check_sorted(2:1, error = FALSE)
check_sorted <- function(x,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(error)

  is_unsorted <- is.unsorted(x, na.rm = TRUE)
  if (is.na(is_unsorted) || is_unsorted) {
    on_fail(x_name, " must be sorted", error = error)
  }
  invisible(x)
}
