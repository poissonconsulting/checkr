#' Check Named
#' 
#' Checks whether an object is named.
#'
#' @param x The object to check.
#' @param nchar A count or count range of the number of characters.
#' @param regex A string of the regular expression that must match all names.
#' @param unique A flag indicating whether the names must be unique.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_unnamed}}, \code{\link{check_names}} and \code{\link{check_missing_names}}
#' @export
#'
#' @examples
#' check_named(2, error = FALSE)
#' x <- 1
#' names(x) <- "y"
#' check_named(x, error = FALSE)
check_named <- function(x, nchar = c(0L, .Machine$integer.max), 
                        regex = ".*", unique = FALSE, 
                        x_name = substitute(x),
                        error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_flag(unique)
  check_flag_internal(error)
  
  if(is.null(names(x))) {
    on_fail(x_name, " must be named", error = error)
  } else {
    check_nchar(names(x), nchar = nchar, x_name = paste("names of", x_name), error = error)
    check_grepl(names(x), regex = regex, x_name = paste("names of", x_name), error = error)
  }
  if(unique)
    check_unique(names(x), x_name = paste("names of", x_name), error = error)
  invisible(x)
}
