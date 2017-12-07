#' Check TimeZone
#'
#' @param x The object to check.
#' @param tz A string of the time zone.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_tz(Sys.Date(), error = FALSE)
#' x <- as.POSIXct("2000-01-02 03:04:55", tz = "Etc/GMT+8")
#' check_tz(x, tz = "PST8PDT", error = FALSE)
check_tz <- function(x, tz = "UTC", x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  tz <- check_string(tz, coerce = TRUE)
  check_flag_internal(error)
  tzone <- attr(x, "tzone")
  
  if(is.null(tzone) || tz != tzone)
    on_fail(x_name, " time zone must be '", tz, "' (not '", tzone, "')", error = error)  
  invisible(x)
}
