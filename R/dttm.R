#' Check Date Time
#' 
#' Checks if x is a datetime (non-missing unnamed POSIXct scalar).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a date to a dttm (using the time zone tzone) and remove names.
#' @param tzone A string of the time zone where "" is the current time zone.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_scalar}}
#' @export
#'
#' @examples
#' check_dttm(Sys.Date(), error = FALSE)
#' check_dttm(Sys.time(), error = FALSE)
check_dttm <- function(x, coerce = FALSE, tzone = "UTC",
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_flag_internal(coerce)
  check_flag_internal(error)
  check_string_internal(tzone)
  
  if(coerce && is_Date(x)) {
    x <- as.POSIXct(as.character(x), tz = tzone)
    x <- unname(x)
  }
  check_scalar(x, values = as.POSIXct("2001-01-01"), 
               x_name = x_name, error = error, attributes = TRUE)
  check_tzone(x, tzone = tzone, error = error)
  invisible(x)
}

#' @rdname check_dttm
#' @export
check_datetime <- function(x,
                           coerce = FALSE,
                           tzone = "",
                           x_name = substitute(x),
                           error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_dttm(x, coerce = coerce, tzone = tzone, 
             x_name = x_name, error = error)
}
