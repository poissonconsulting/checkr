#' Check Length
#'
#' @param x The object to check.
#' @param min_length A count of the minimum length.
#' @param max_length A count of the maximum length.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_length(2)
#' check_length(character(0), min_length = 0)
#' check_length(NULL, error = FALSE)
#' check_length(list(), error = FALSE)
check_length <- function(x,
                         min_length = 1L,
                         max_length = .Machine$integer.max,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_count_internal(min_length)
  check_count_internal(max_length)

  check_flag_internal(error)

  if (max_length < min_length) {
    error("max_length must not be less than min_length")
  }
  if (min_length == max_length) {
    if (length(x) != min_length) {
      on_fail(x_name, " must be length ", min_length, error = error)
    }
    return(invisible(x))
  }

  if (length(x) < min_length) {
    on_fail(x_name, " must be at least of length ", min_length, error = error)
  }
  if (length(x) > max_length) {
    on_fail(x_name, " must not be longer than ", max_length, error = error)
  }
  invisible(x)
}
