#' Check Logical
#' 
#' Checks if x is a logical vector with no attributes including names.
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to drop attributes including names.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_scalar}}
#' @export
#'
#' @examples
#' check_logical(1, error = FALSE)
#' check_logical(FALSE, error = FALSE)
#' check_logical(c(FALSE, TRUE), error = FALSE)
check_logical <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce)
    attributes(x) <- NULL

  check_vector(x, values = c(TRUE, NA), named = FALSE, 
                x_name = x_name, error = error)
}
