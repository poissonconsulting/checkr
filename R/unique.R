#' Check Unique
#' 
#' Checks whether all elements of an object are unique.
#' 
#' @inheritParams params
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso [check_vector()]
#' @export
#'
#' @examples
#' check_unique(2, error = FALSE)
#' check_unique(c(2,2), error = FALSE)
#' check_unique(1:2, error = FALSE)
#' check_unique(character(0), error = FALSE)
#' check_unique(NULL, error = FALSE)
#' check_unique(list(), error = FALSE)
check_unique <- function(x,
                         x_name = substitute(x),
                         error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_unique()", "chk::chk_unique()")
  x_name <- chk_deparse(x_name)

  check_flag_internal(error)

  if(anyDuplicated(x)) {
    chk_fail(x_name, " must be unique", error = error)
  }
  invisible(x)
}
