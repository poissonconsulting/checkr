#' Check Unused
#' 
#' Checks whether ... is unused. It can only be used in functions.
#' 
#' @param ... The arguments to check.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#' @examples
#' fun <- function(...) check_unused(..., error = FALSE)
#' fun()
#' fun(1)
check_unused <- function(..., error = TRUE) {
  if(length(list(...)))
    on_fail("... must be unused", error = error)
  invisible(...)
}
