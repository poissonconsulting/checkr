#' Check Scalar
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_scalar(2)
#' check_scalar(character(0), error = FALSE)
#' check_scalar(NULL, error = FALSE)
check_scalar <- function(x,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  if (!is.atomic(x)) error(x_name, " must be an atomic vector")

  check_length(x, x_name = x_name, length = 1, error = error)
  check_unnamed(x, x_name = x_name, error = error)
  invisible(x)
}

#' Check Flag
#' 
#' Checks if x is a flag (non-missing logical scalar).
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
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

  check_vector(x, values = TRUE, length = 1,
               x_name = x_name, error = error)
}

#' Check Count
#'
#' Checks if object is a count (non-negative integer or if \code{coerce = TRUE} non-negative numeric whole number).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a non-negative numeric (real) whole number to a count.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_count(-1L, error = FALSE)
#' check_count(1L, error = FALSE)
#' check_count(1, error = FALSE)
#' check_count(1, coerce = TRUE, error = FALSE)
#' check_count(1.01, coerce = TRUE, error = FALSE)
check_count <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)

  if(coerce && is.numeric(x) && identical(as.numeric(as.integer(x)), x)) {
    x <- as.integer(x)     
  }
  
  check_vector(x, values = c(0L, .Machine$integer.max), length = 1,
               x_name = x_name, error = error)
}

#' Check String
#'
#' Checks if object is a string (non-missing character scalar or if \code{coerce = TRUE} a non-missing factor scalar).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a factor scalar to a string.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_string(1, error = FALSE)
#' check_string("1", error = FALSE)
#' check_string(c("1", "2"), error = FALSE)
check_string <- function(x,
                        coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce && is.factor(x))
    x <- as.character(x)

  check_vector(x, values = character(1), length = 1,
               x_name = x_name, error = error)
}
