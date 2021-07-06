#' Check Logical
#' 
#' Checks if x is a logical vector with no attributes including names.
#'
#' @inheritParams params
#' @param coerce A flag indicating whether to drop attributes including names.
#' 
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
  lifecycle::deprecate_soft("0.5.1", "check_logical()", "chk::chk_logical()")
  x_name <- chk_deparse(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce)
    attributes(x) <- NULL

  check_vector(x, values = c(TRUE, NA), named = FALSE, 
                x_name = x_name, error = error)
}
