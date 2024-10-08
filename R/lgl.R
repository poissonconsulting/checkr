#' Check Flag
#' 
#' Checks if x is a flag (non-missing logical scalar with no attributes including names).
#'
#' @inheritParams params
#' @param coerce A flag indicating whether to drop attributes including names.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso [check_scalar()]
#' @export
#'
#' @examples
#' check_lgl(1, error = FALSE)
#' check_lgl(FALSE, error = FALSE)
#' check_lgl(c(FALSE, TRUE), error = FALSE)
check_lgl <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_lgl()", "chk::chk_lgl()")
  x_name <- chk_deparse(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce)
    attributes(x) <- NULL

  check_scalar(x, values = TRUE, x_name = x_name, error = error)
}

#' @rdname check_lgl
#' @export
check_flag <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_flag()", "chk::chk_flag()")
  x_name <- chk_deparse(x_name)
  
  check_lgl(x, coerce = coerce, x_name = x_name, error = error)
}

#' Check Flag or NA
#' 
#' Checks if x is a flag or NA (missing logical scalar).
#' 
#' Useful when using flag to pass one of three options.
#'
#' @inheritParams check_flag
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
check_flag_na <- function(x, coerce = TRUE,
                       x_name = substitute(x),
                       error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_flag_na()", "chk::check_values()")
  x_name <- chk_deparse(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce)
    attributes(x) <- NULL

  check_scalar(x, values = c(TRUE, NA), x_name = x_name, error = error)
}

