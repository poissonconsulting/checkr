#' Check Character
#' 
#' Checks if x is a character vector with no attributes including names.
#'
#' @param x The object to check.
#' @param coerce A flag indicating whether to coerce a factor to a character vector and drop attributes including names.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_int}}
#' @export
#'
#' @examples
#' check_character("1", error = FALSE)
#' check_character(1:2, error = FALSE)
check_character <- function(x, coerce = FALSE,
                      x_name = substitute(x),
                      error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(coerce)
  check_flag_internal(error)
  
  if(coerce) {
    if(is.factor(x)) x <- as.character(x)
    if(is.character(x)) attributes(x) <- NULL
  }
  
  check_vector(x, values = c("", NA_character_), named = FALSE, x_name = x_name, 
               error = error)
}
