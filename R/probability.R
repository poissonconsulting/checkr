#' Check Probability
#' 
#' Checks if x is a probability (non-missing numeric scalar between 0 and 1 inclusive).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce an integer to numeric.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_probability(1, error = FALSE)
#' check_probability(1.1, error = FALSE)
#' check_probability(c(0, 1), error = FALSE)
check_probability <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce && is.integer(x))
    x <- as.numeric(x)

  check_vector(x, values = c(0,1), length = 1,
               x_name = x_name, error = error)
}
