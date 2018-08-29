#' Check TimeZone
#' 
#' Checks an objects tzone attribute.
#'
#' @param x The object to check.
#' @param tzone A string of the time zone.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_tzone(Sys.Date(), error = FALSE)
#' x <- as.POSIXct("2000-01-02 03:04:55", tz = "Etc/GMT+8")
#' check_tzone(x, tzone = "PST8PDT", error = FALSE)
check_tzone <- function(x, tzone = "UTC", x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  tzone <- check_string(tzone, coerce = TRUE)
  check_flag_internal(error)

  if(is.null(attr(x, "tzone")) || tzone != attr(x, "tzone"))
    on_fail(x_name, " time zone must be '", tzone, 
            "' (not '", attr(x, "tzone"), "')", error = error)  
  invisible(x)
}

#' @rdname check_tzone
#' @param tz A string of the time zone.
#' @export
check_tz <- function(x, tz = "UTC", x_name = substitute(x),
                         error = TRUE) {
  .Deprecated("check_tzone")
  x_name <- deparse_x_name(x_name)
  check_tzone(x, tzone = tz, x_name = x_name, error = error)
}
