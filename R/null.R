#' Check NULL
#' 
#' Checks whether an object is NULL.
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_null(1, error = FALSE)
#' check_null(NULL, error = FALSE)
check_null <- function(x,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(error)

  if (!is.null(x)) chk_fail(x_name, " must be NULL", error = error)
  invisible(x)
}
