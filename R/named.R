#' Check Named
#' 
#' Checks whether an object is named.
#'
#' @inheritParams params
#' @param nchar A count or count range of the number of characters.
#' @param pattern A string of the regular expression that must match all names.
#' @param regex A string of the regular expression that must match all names.
#' @param unique A flag indicating whether the names must be unique.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso [check_unnamed()], [check_names()] and [check_missing_names()]
#' @export
#'
#' @examples
#' check_named(2, error = FALSE)
#' x <- 1
#' names(x) <- "y"
#' check_named(x, error = FALSE)
check_named <- function(x, nchar = c(0L, chk_max_int()), 
                        pattern = ".*",
                        regex = pattern, unique = FALSE, 
                        x_name = substitute(x),
                        error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_flag(unique)
  check_flag_internal(error)

  if (!missing(regex)) {
    lifecycle::deprecate_soft("0.5.1", "check_named()", "chk::chk_named()")
    check_string(regex)
    pattern <- regex
  }
  
  if(is.null(names(x))) {
    chk_fail(x_name, " must be named", error = error)
  } else {
    check_nchar(names(x), nchar = nchar, x_name = paste("names of", x_name), error = error)
    check_grepl(names(x), pattern = pattern, x_name = paste("names of", x_name), error = error)
    if(unique)
      check_unique(names(x), x_name = paste("names of", x_name), error = error)
  }
  invisible(x)
}
