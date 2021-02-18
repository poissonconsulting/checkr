#' Check Inherits
#' 
#' Checks if an object inherits from a class.
#'
#' @inheritParams params
#' @param class A string of the class x should inherit from.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_classes}}
#' @export
#'
#' @examples
#' check_inherits(list(), "list")
#' check_inherits(list(), "numeric", error = FALSE)
check_inherits <- function(x, class,
                     x_name = substitute(x),
                     error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_string_internal(class)
  check_flag_internal(error)
  
  if(!inherits(x, class)) {
    chk_fail(x_name, " must inherit from class ", class, error = error)
  }
  invisible(x)
}
