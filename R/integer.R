#' Check Integer
#' 
#' Checks if x is an integer vector with no attributes including names.
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a numeric (dbl) whole number vector to an integer vector and drop attributes including names.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_int}}
#' @export
#'
#' @examples
#' check_integer(1, error = FALSE)
#' check_integer(1L, error = FALSE)
#' check_integer(1:2, error = FALSE)
check_integer <- function(x, coerce = FALSE,
                      x_name = substitute(x),
                      error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce) {
    attributes(x) <- NULL
    if(is.double(x) && identical(as.double(as.integer(x)), x))
      x <- as.integer(x)     
  }
  
  check_vector(x, values = c(1L, NA_integer_), named = FALSE, x_name = x_name, 
               error = error)
}
