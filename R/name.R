#' Check Name
#'
#' Checks whether each element of a character vector is a syntactically valid name.
#' 
#' @inheritParams params
#' @param coerce A flag specifying whether to coerce a factor to a character vector and drop attributes including names.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_character}}
#' @export
#'
#' @examples
#' vec <- c("x", "x.y", "x y")
#' check_name(vec, error = FALSE)
check_name <- function(x, x_name = substitute(x), coerce = FALSE, error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(coerce)
  check_flag_internal(error)
  
  x <- check_character(x, coerce = coerce, x_name = x_name, error = TRUE)
  
  invalid <- x != make.names(x)
  if(any(invalid)) {
    msg <- p0("the following %n value%s of ", x_name, " %r invalid: %c")
    msg <- co_and(x[invalid], msg)
    chk_fail(msg, error = error)
  }
  invisible(x)
}
