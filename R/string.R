#' Check String
#'
#' Checks if object is a string (non-missing character scalar or if \code{coerce = TRUE} a non-missing factor scalar).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a factor scalar to a string.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_scalar}}
#' @export
#'
#' @examples
#' check_string(1, error = FALSE)
#' check_string("1", error = FALSE)
#' check_string(c("1", "2"), error = FALSE)
check_string <- function(x,
                        coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce && is.factor(x))
    x <- as.character(x)

  check_vector(x, values = character(1), length = 1,
               x_name = x_name, error = error)
}
