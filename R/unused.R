#' Check Unused
#' 
#' Checks whether ... is unused. It can only be used in functions.
#' 
#' @param ... The arguments to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#' @examples
#' fun <- function(...) check_unused(..., error = FALSE)
#' fun()
#' fun(1)
check_unused <- function(..., x_name = "...", error = TRUE) {
  check_string_internal(x_name)
  if(length(list(...)))
    chk_fail(x_name, " must be unused", error = error)
  invisible(...)
}
