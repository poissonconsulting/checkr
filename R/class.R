#' Check Vector Class
#'
#' @param x The object to check.
#' @param values A vector specifying the class.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_class(2, 1, error = FALSE)
#' check_class(2L, 1, error = FALSE)
#' check_class(list(x = 1), list(), error = FALSE)
check_class <- function(x,
                         values,
                         x_name = substitute(x),
                         error = getOption("vectorcheckr.error", TRUE)) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)
  check_flag_internal(error)

  class <- class(values)
  class <- class[length(class)]

  if (!inherits(x, class)) {
    on_fail(x_name, " must be of class ", class, error = error)
  }
  invisible(x)
}
