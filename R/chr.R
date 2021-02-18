#' Check String
#'
#' Checks if object is a string (non-missing character scalar with no attributes including names).
#'
#' @inheritParams params
#' @param coerce A flag indicating whether to coerce a factor scalar to a string and drop attributes including names.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_scalar}}
#' @export
#'
#' @examples
#' check_chr(1, error = FALSE)
#' check_chr("1", error = FALSE)
#' check_chr(c("1", "2"), error = FALSE)
check_chr <- function(x,
                         coerce = FALSE,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce) {
    if(is.factor(x)) x <- as.character(x)
    if(is.character(x)) attributes(x) <- NULL
  }
  check_scalar(x, values = character(1), x_name = x_name, error = error)
}

#' @rdname check_chr
#' @export
check_string <- function(x,
                         coerce = FALSE,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_chr(x, coerce = coerce, x_name = x_name, error = error)
}

