#' Check Matches Regular Expression
#' 
#' Checks whether all the elements of an object match a regular expression.
#'
#' @param x The object to check.
#' @param pattern A string of the regular expression.
#' @param regex A string of the regular expression (deprecated for pattern).
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_nchar}} and \code{\link{check_pattern}}
#' @export
#'
#' @examples
#' check_grepl("foo", "fo")
#' check_grepl("foo", "fo$", error = FALSE)
check_grepl <- function(x, pattern = ".*", regex = pattern, x_name = substitute(x),
                        error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_string(pattern)
  check_flag_internal(error)
  
  if (!missing(regex)) {
    warning("argument regex is deprecated; please use pattern instead.", 
            call. = FALSE)
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
  .Deprecated("check_grepl")
  x_name <- deparse_x_name(x_name)
  check_grepl(x, regex = regex, x_name = x_name, error = error)
}
