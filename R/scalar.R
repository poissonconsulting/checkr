#' Check Scalar
#' 
#' Checks whether an object is an atomic vector with one element.
#'
#' @inheritParams params
#' @param named A flag indicating whether the scalar must be named or unnamed or NA if it doesn't matter if the scalar is named.
#' @param attributes A flag indicating whether the scalar must or must not have attributes or NA if it doesn't matter if the scalar is named.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_vector}}
#' @export
#' @examples 
#' check_scalar(1)
#' check_scalar(c(1,2), error = FALSE)
#' check_scalar(1, c(2,3), error = FALSE)
check_scalar <- function(x,
                         values = NULL,
                         named = FALSE,
                         attributes = named,
                         only = FALSE,
                         x_name = substitute(x),
                         error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_scalar()", "chk::check_scalar()",
                            "Use chk::chk_scalar() for a faster version which returns NULL.")
  x_name <- chk_deparse(x_name)

  check_vector(x, values = values, length = 1L, named = named, 
               attributes = attributes, only = only,
               x_name =  x_name, error = error)
}
