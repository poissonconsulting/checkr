#' Check TimeZone
#' 
#' Checks an objects tzone attribute.
#'
#' @inheritParams params
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_tzone(Sys.Date(), error = FALSE)
#' x <- as.POSIXct("2000-01-02 03:04:55", tz = "Etc/GMT+8")
#' check_tzone(x, tzone = "PST8PDT", error = FALSE)
check_tzone <- function(x, tzone = "UTC", x_name = substitute(x),
                         error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_tzone()", "chk::chk_tz()")
  x_name <- chk_deparse(x_name)
  
  tzone <- check_string(tzone, coerce = TRUE)
  check_flag_internal(error)

  attr_tzone <- attr(x, "tzone")
  if(is.null(attr_tzone)) attr_tzone <- "NULL"
  if(tzone != attr_tzone)
    chk_fail(x_name, " time zone must be '", tzone, 
            "' (not '", attr_tzone, "')", error = error)  
  invisible(x)
}
