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
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)

  if (!is.atomic(x)) error(x_name, " must be an atomic vector")

  check_length(x, x_name = x_name, max_length = 1, error = error)
  check_unnamed(x, x_name = x_name, error = error)
  invisible(x)
}

#' Check Flag
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
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)
  check_flag_internal(error)

  check_vector(x, values = TRUE, min_length = 1, max_length = 1,
               x_name = x_name, error = error)
}

#' Check Count
#'
#' Checks if object is a non-negative integer.
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_count(-1L, error = FALSE)
#' check_count(1L, error = FALSE)
#' check_count(1, error = FALSE)
check_count <- function(x,
                       x_name = substitute(x),
                       error = TRUE) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)
  check_flag_internal(error)

  check_vector(x, values = c(0L, .Machine$integer.max), min_length = 1, max_length = 1,
               x_name = x_name, error = error)
}

#' Check String
#'
#' Checks if object is a string.
#'
#' @param x The object to check.
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
                       x_name = substitute(x),
                       error = TRUE) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)
  check_flag_internal(error)

  check_vector(x, values = character(1), min_length = 1, max_length = 1,
               x_name = x_name, error = error)
}
