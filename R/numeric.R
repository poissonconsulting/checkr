#' Check Numeric
#' 
#' Checks if x is an numeric (double) vector with no attributes including names.
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a integer vector to an double vector and drop attributes including names.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_number}}
#' @export
#'
#' @examples
#' check_numeric(1, error = FALSE)
#' check_numeric(1L, error = FALSE)
#' check_numeric(1:2, error = FALSE)
check_numeric <- function(x, coerce = FALSE,
                      x_name = substitute(x),
                      error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce) {
    attributes(x) <- NULL
    if(is.integer(x)) x <- as.double(x)    
  }
  
  check_vector(x, values = c(1, NA_real_), named = FALSE, x_name = x_name, 
               error = error)
}

#' @rdname check_numeric
#' @export
check_double <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_numeric(x, coerce = coerce, x_name = x_name, error = error)
}
