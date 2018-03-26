#' Check Date Time
#' 
#' Checks if x is a datetime (non-missing POSIXct scalar).
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_scalar}}
#' @export
#'
#' @examples
#' check_datetime(Sys.Date(), error = FALSE)
#' check_datetime(Sys.time(), error = FALSE)
check_datetime <- function(x,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_flag_internal(error)
  
  check_vector(x, values = as.POSIXct("2001-01-01"), length = 1,
               x_name = x_name, error = error)
}
