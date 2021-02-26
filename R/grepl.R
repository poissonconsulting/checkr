#' Check Matches Regular Expression
#' 
#' Checks whether all the elements of an object match a regular expression.
#'
#' @inheritParams params
#' @param regex A string of the regular expression (deprecated for pattern).
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_nchar}} and \code{\link{check_pattern}}
#' @export
#'
#' @examples
#' check_grepl("foo", "fo")
#' check_grepl("foo", "fo$", error = FALSE)
check_grepl <- function(x, pattern = ".*", regex = pattern, x_name = substitute(x),
                        error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_string(pattern)
  check_flag_internal(error)
  
  if (!missing(regex)) {
    lifecycle::deprecate_soft("0.5.1", "check_grepl(regex)", "check_grepl(pattern)")
    check_string(regex)
    pattern <- regex
  }
  
  if(!all(grepl(pattern, x)))
    chk_fail(x_name, " must match regular expression '", pattern, "'", error = error)
  invisible(x)
}

#' @rdname check_grepl
#' @export
check_regex <- function(x, regex = ".*", x_name = substitute(x),
                        error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_regex()", "check_grepl()")
  x_name <- chk_deparse(x_name)
  check_grepl(x, regex = regex, x_name = x_name, error = error)
}
