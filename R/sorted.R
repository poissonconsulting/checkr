#' Check Sorted
#' 
#' Checks whether object x is sorted using \code{!is.unsorted(x, na.rm = TRUE)}.
#' 
#' @inheritParams params
#' 
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
  lifecycle::deprecate_soft("0.5.1", "check_sorted()", "chk::check_sorted()",
                            "Use chk::chk_sorted() for a faster version which returns NULL.")
  x_name <- chk_deparse(x_name)

  check_flag_internal(error)

  is_unsorted <- is.unsorted(x, na.rm = TRUE)
  if (is.na(is_unsorted) || is_unsorted) {
    chk_fail(x_name, " must be sorted", error = error)
  }
  invisible(x)
}
