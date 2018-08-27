#' Check Flag
#' 
#' Checks if x is a flag (non-missing logical scalar).
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_scalar}}
#' @export
#'
#' @examples
#' check_flag(1, error = FALSE)
#' check_flag(FALSE, error = FALSE)
#' check_flag(c(FALSE, TRUE), error = FALSE)
check_flag <- function(x,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(error)

  check_scalar(x, values = TRUE,
               x_name = x_name, error = error)
}

#' Check Flag or NA
#' 
#' Checks if x is a flag or NA (missing logical scalar).
#' 
#' Useful when using flag to pass one of three options.
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_flag_na(1, error = FALSE)
#' check_flag_na(FALSE)
#' check_flag_na(NA)
#' check_flag_na(NA_character_, error = FALSE)
#' check_flag_na(c(NA, NA), error = FALSE)
check_flag_na <- function(x,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(error)

  check_scalar(x, values = c(TRUE, NA),
               x_name = x_name, error = error)
}

