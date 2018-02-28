#' Check Matches Regular Expression
#'
#' @param x The object to check.
#' @param regex A string of the regular expression.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_regex("foo", "fo")
#' check_regex("foo", "fo$", error = FALSE)
check_regex <- function(x, regex = ".*", x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_string(regex)
  check_flag_internal(error)

  if(!all(grepl(regex, x)))
    on_fail(x_name, " must match regular expression '", regex, "'", error = error)
  invisible(x)
}
