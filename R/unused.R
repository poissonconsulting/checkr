#' Check Unused
#' 
#' Checks whether ... is unused. It can only be used in functions.
#' 
#' @inheritParams params
#' @param ... The arguments to check.
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
