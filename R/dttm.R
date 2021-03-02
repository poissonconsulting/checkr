#' Check Date Time
#' 
#' Checks if x is a datetime (non-missing unnamed POSIXct scalar).
#'
#' @inheritParams params
#' @param coerce A flag indicating whether to coerce a date to a dttm (using the time zone tzone) and remove names.
#' @param tzone A string of the time zone where "" is the current time zone.
#' 
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
  lifecycle::deprecate_soft("0.5.1", "check_dttm()", "chk::check_date_time()",
                            "Use chk::chk_date_time() for a faster version which returns NULL.")
  x_name <- chk_deparse(x_name)
  
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
  lifecycle::deprecate_soft("0.5.1", "check_datetime()", "chk::check_date_time()",
                            "Use chk::chk_date_time() for a faster version which returns NULL.")
  x_name <- chk_deparse(x_name)
  
  check_dttm(x, coerce = coerce, tzone = tzone, 
             x_name = x_name, error = error)
}
