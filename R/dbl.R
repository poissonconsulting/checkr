#' Check Dbl
#' 
#' Checks if x is a dbl (non-missing numeric scalar with no attributes including names).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a scalar integer to a dbl and drop attributes including names.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_scalar}}
#' @export
#'
#' @examples
#' check_dbl(1, error = FALSE)
#' check_dbl(1L, error = FALSE)
#' check_dbl(c(1,2), error = FALSE)
check_dbl <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- chk_deparse(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)

  if(coerce) {
    attributes(x) <- NULL
    if(is.integer(x)) x <- as.double(x)     
  }
  
  check_scalar(x, values = 1, x_name = x_name, error = error)
}

#' @rdname check_dbl
#' @export
check_number <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_dbl(x, coerce = coerce, x_name = x_name, error = error)
}

#' Check Positive Dbl
#' 
#' Checks if x is a positive dbl (non-missing numeric scalar with no attributes including names).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a scalar integer to a dbl and drop attributes including names.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_dbl}}
#' @export
#'
#' @examples
#' check_pos_dbl(1, error = FALSE)
#' check_pos_dbl(0L, error = FALSE)
#' check_pos_dbl(0, error = FALSE)
check_pos_dbl <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- chk_deparse(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)

  if(coerce) {
    attributes(x) <- NULL
    if(is.integer(x)) x <- as.double(x)     
  }
  
  check_scalar(x, 1, x_name = x_name, error = error)
  if(x <= 0) chk_fail(x_name, " must be positive", error = error)
  invisible(x)
}

#' Check Non-Negative Dbl
#' 
#' Checks if x is a non-negative dbl (non-missing numeric scalar with no attributes including names).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a scalar integer to a dbl and drop attributes including names.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_dbl}}
#' @export
#'
#' @examples
#' check_noneg_dbl(1, error = FALSE)
#' check_noneg_dbl(0L, error = FALSE)
#' check_noneg_dbl(0, error = FALSE)
check_noneg_dbl <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- chk_deparse(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)

  if(coerce) {
    attributes(x) <- NULL
    if(is.integer(x)) x <- as.double(x)     
  }
  
  check_scalar(x, 1, x_name = x_name, error = error)
  if(x < 0) chk_fail(x_name, " must be non-negative", error = error)
  invisible(x)
}

#' Check Negative Dbl
#' 
#' Checks if x is a negative dbl (non-missing numeric scalar with no attributes including names).
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a scalar integer to a dbl and drop attributes including names.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_dbl}}
#' @export
#'
#' @examples
#' check_neg_dbl(1, error = FALSE)
#' check_neg_dbl(0L, error = FALSE)
#' check_neg_dbl(0, error = FALSE)
check_neg_dbl <- function(x, coerce = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- chk_deparse(x_name)

  check_flag_internal(coerce)
  check_flag_internal(error)

  if(coerce) {
    attributes(x) <- NULL
    if(is.integer(x)) x <- as.double(x)     
  }
  
  check_scalar(x, 1, x_name = x_name, error = error)
  if(x >= 0) chk_fail(x_name, " must be negative", error = error)
  invisible(x)
}
