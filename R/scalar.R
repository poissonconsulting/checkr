#' Check Scalar
#' 
#' Checks whether an object is an atomic vector with one element.
#'
#' @param x The object to check.
#' @param values An optional vector specifying the values.
#' @param named A flag indicating whether the scalar must be named or unnamed or NA if it doesn't matter if the scalar is named.
#' @param attributes A flag indicating whether the scalar must or must not have attributes or NA if it doesn't matter if the scalar is named.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_vector}}
#' @export
#' @examples 
#' check_scalar(1)
#' check_scalar(c(1,2), error = FALSE)
#' check_scalar(1, c(2,3), error = FALSE)
check_scalar <- function(x,
                         values,
                         named = FALSE,
                         attributes = named,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)
  if(!(is_flag(named) || is_NA(named))) err("named must be a flag or NA")
  
  check_vector(x, values = values, length = 1L, named = named, 
               attributes = attributes,
               x_name =  x_name, error = error)
}
