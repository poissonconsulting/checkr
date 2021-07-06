#' Check Int
#' 
#' Checks if x is a int (non-missing integer scalar with no attributes including names).
#'
#' @inheritParams params
#' @param coerce A flag indicating whether to coerce a numeric (dbl) whole number to an int and drop attributes including names.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_scalar}}
#' @export
#'
#' @examples
#' check_int(1, error = FALSE)
#' check_int(1L, error = FALSE)
#' check_int(1:2, error = FALSE)
check_int <- function(x, coerce = FALSE,
                      x_name = substitute(x),
                      error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_int()", "chk::chk_integer()")
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce) {
    attributes(x) <- NULL
    if(is.double(x) && identical(as.double(as.integer(x)), x))
      x <- as.integer(x)     
  }
  
  check_scalar(x, values = 1L, x_name = x_name, error = error)
}

#' Check Positive Int
#' 
#' Checks if x is a positive int (non-missing integer scalar with no attributes including names).
#'
#' @inheritParams params
#' @param coerce A flag indicating whether to coerce a numeric (dbl) whole number to an int and drop attributes including names.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_int}}
#' @export
#'
#' @examples
#' check_pos_int(0, error = FALSE)
#' check_pos_int(1L, error = FALSE)
#' check_pos_int(1:2, error = FALSE)
check_pos_int <- function(x, coerce = FALSE,
                      x_name = substitute(x),
                      error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_pos_int()", NULL,
                            "Please use chk::chk_integer() and chk::chk_gt() instead.")
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce) {
    attributes(x) <- NULL
    if(is.double(x) && identical(as.double(as.integer(x)), x))
      x <- as.integer(x)     
  }
  check_scalar(x, values = c(1L, chk_max_int()), x_name = x_name, error = error)
}

#' Check Negative Int
#' 
#' Checks if x is a negative int (non-missing integer scalar with no attributes including names).
#'
#' @inheritParams params
#' @param coerce A flag indicating whether to coerce a numeric (dbl) whole number to an int and drop attributes including names.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_int}}
#' @export
#'
#' @examples
#' check_neg_int(0L, error = FALSE)
#' check_neg_int(-1L, error = FALSE)
check_neg_int <- function(x, coerce = FALSE,
                      x_name = substitute(x),
                      error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_neg_int()", NULL,
                            "Please use chk::chk_integer() and chk::chk_lt() instead.")
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce) {
    attributes(x) <- NULL
    if(is.double(x) && identical(as.double(as.integer(x)), x))
      x <- as.integer(x)     
  }
  check_scalar(x, values = c(chk_min_int(), -1L), x_name = x_name, error = error)
}

#' Check Non-Negative Int
#' 
#' Checks if x is a count (non-missing non-negative integer scalar with no attributes including names).
#'
#' @inheritParams params
#' @param coerce A flag indicating whether to coerce a non-negative numeric (dbl) whole number to a count and drop attributes (including names).
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_int}}
#' @export
#'
#' @examples
#' check_noneg_int(1, error = FALSE)
#' check_noneg_int(0L, error = FALSE)
#' check_noneg_int(1L, error = FALSE)
check_noneg_int <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_noneg_int()", NULL,
                            "Please use chk::chk_integer() and chk::chk_gte() instead.")
  x_name <- chk_deparse(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)

  if(coerce) {
    attributes(x) <- NULL
    if(is.double(x) && identical(as.double(as.integer(x)), x))
      x <- as.integer(x)     
  }
  check_scalar(x, c(0L, chk_max_int()), x_name = x_name, error = error)
}

#' Check Count
#'
#' Checks if an object is a count (non-negative integer or if \code{coerce = TRUE} non-negative numeric whole number).
#'
#' @inheritParams params
#' @param coerce A flag indicating whether to coerce a non-negative numeric (dbl) whole number to a count and drop attributes (including names).
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_scalar}}
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
  lifecycle::deprecate_soft("0.5.1", "check_count()", NULL,
                            "Please use chk::chk_whole_number() and chk::chk_gte() instead.")
  x_name <- chk_deparse(x_name)
  
  check_noneg_int(x = x, coerce = coerce, x_name = x_name, error = error)
}
