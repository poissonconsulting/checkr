#' Check Length
#'
#' @param x The object to check.
#' @param length A flag indicating whether x should have elements (versus no elements) or a missing value indicating no requirements or a count or count range of the number of elements.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_length(2)
#' check_length(character(0), length = 0)
#' check_length(NULL, error = FALSE)
#' check_length(list(), error = FALSE)
check_length <- function(x,
                         length = TRUE,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_length_internal(length)

  check_flag_internal(error)
  
  check_n(x, n = length(x), range = length, x_name = x_name, n_name = "element", error = error)
  invisible(x)
}

#' Check Length One
#' 
#' Checks whether x is an object of length 1.
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_length1(2)
#' check_length1(1:2, error = FALSE)
#' check_length1(NULL, error = FALSE)
#' check_length1(list(), error = FALSE)
check_length1 <- function(x,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_length(x, length = 1L, x_name = x_name, error = error)
  invisible(x)
}
