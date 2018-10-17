#' Check Int
#' 
#' Checks if x is a int (non-missing integer scalar with no attributes including names).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a numeric (dbl) whole number to an int and drop attributes including names.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_scalar}}
#' @export
#'
#' @examples
#' check_int(1, error = FALSE)
#' check_int(1L, error = FALSE)
#' check_int(1:2, error = FALSE)
check_int <- function(x, coerce = FALSE,
                      x_name = substitute(x),
                      error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce) {
    attributes(x) <- NULL
    if(is.double(x) && identical(as.double(as.integer(x)), x))
      x <- as.integer(x)     
  }
  
  check_scalar(x, values = 1L, x_name = x_name, error = error)
}

#' Check Count
#'
#' Checks if an object is a count (non-negative integer or if \code{coerce = TRUE} non-negative numeric whole number).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a non-negative numeric (dbl) whole number to a count and drop attributes (including names).
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_scalar}}
#' @export
#'
#' @examples
#' check_count(-1L, error = FALSE)
#' check_count(1L, error = FALSE)
#' check_count(1, error = FALSE)
#' check_count(1, coerce = TRUE, error = FALSE)
#' check_count(1.01, coerce = TRUE, error = FALSE)
check_count <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)

  if(coerce && is.numeric(x) && identical(as.numeric(as.integer(x)), x)) {
    x <- as.integer(x)     
  }
  
  check_scalar(x, values = c(0L, chk_max_int()), 
               x_name = x_name, error = error)
}

