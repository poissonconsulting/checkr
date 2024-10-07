#' Check Length
#' 
#' Checks whether the number of elements in an object is an exact number, 
#' within a range or 0 vs positive.
#'
#' @inheritParams params
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso [check_vector()], [check_list()] and [check_data()]
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
  lifecycle::deprecate_soft("0.5.1", "check_length()", "chk::check_dim()")
  x_name <- chk_deparse(x_name)

  check_length_internal(length)

  check_flag_internal(error)
  
  check_n(x, n = length(x), range = length, x_name = x_name, n_name = "element", error = error)
  invisible(x)
}

#' Check Length One
#' 
#' Checks whether x is an object of length 1.
#'
#' @inheritParams params
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
  lifecycle::deprecate_soft("0.5.1", "check_length1()", "chk::check_dim()")
  x_name <- chk_deparse(x_name)

  check_length(x, length = 1L, x_name = x_name, error = error)
  invisible(x)
}
