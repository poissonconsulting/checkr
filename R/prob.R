#' Check Probability
#' 
#' Checks if x is a probability (non-missing dbl between 0 and 1 inclusive with no attributes including names).
#'
#' @inheritParams params
#' @param coerce A flag indicating whether to coerce an integer to a dbl and drop attributes including names.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso [check_scalar()]
#' @export
#'
#' @examples
#' check_prob(1, error = FALSE)
#' check_prob(1.1, error = FALSE)
#' check_prob(c(0, 1), error = FALSE)
check_prob <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_prob()", NULL,
                            "Please use chk::chk_dbl() and chk::chk_range() instead.")
  x_name <- chk_deparse(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce) {
    attributes(x) <- NULL
    if(is.integer(x))
      x <- as.numeric(x)
  }
  check_scalar(x, values = c(0,1), x_name = x_name, error = error)
}

#' @rdname check_prob
#' @export
check_probability <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_probability()", NULL,
                            "Please use chk::chk_dbl() and chk::chk_range() instead.")
  x_name <- chk_deparse(x_name)

  check_prob(x, coerce = coerce, x_name = x_name, error = error)
}

#' @rdname check_prob
#' @export
check_prop <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_prop()", NULL,
                            "Please use chk::chk_dbl() and chk::chk_range() instead.")
  x_name <- chk_deparse(x_name)

  check_prob(x, coerce = coerce, x_name = x_name, error = error)
}
