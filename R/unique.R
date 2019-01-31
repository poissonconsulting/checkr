#' Check Unique
#' 
#' Checks whether all elements of an object are unique.
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_vector}}
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
  x_name <- chk_deparse(x_name)

  check_flag_internal(error)

  if(anyDuplicated(x)) {
    chk_fail(x_name, " must be unique", error = error)
  }
  invisible(x)
}
