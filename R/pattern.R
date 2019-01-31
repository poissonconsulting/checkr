#' Check Pattern
#' 
#' Checks whether all or some of the elements of x match pattern using \code{\link{grepl}}.
#' 
#' @param x The object to check.
#' @param pattern A string of the regular expression.
#' @param all A flag indicating whether all or some of the element must match pattern.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_nchar}} and \code{\link{check_regex}}
#' @export
check_pattern <- function(x, pattern, all = TRUE,
                          x_name = substitute(x),
                         error = TRUE) {
  .Deprecated("check_grepl")
  x_name <- chk_deparse(x_name)

  check_string_internal(pattern)
  check_flag_internal(all)
  check_flag_internal(error)
  
  match <- grepl(pattern, x)
  
  if(all) {
    if(!all(match)) chk_fail("all elements of ", x_name, " must match regular expression '", pattern, "'", error = error)
    return(invisible(x))
  }
  if(!any(match)) {
    chk_fail("at least one element of ", x_name, " must match regular expression '", pattern, "'", error = error)
  }
  invisible(x)
}
