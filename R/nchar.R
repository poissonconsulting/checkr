#' Check Number of Characters
#'
#' @param x The object to check.
#' @param nchar A flag indicating whether x should have characters or a missing value indicating no requirements or a count or count range of the number of characters.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_nchar(c("foo", "bar"), nchar = 3)
check_nchar <- function(x, nchar = TRUE, x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_flag_internal(error)
  
  if(!(is_flag(nchar) || is_NA(nchar) || is_count(nchar) || is_count_range(nchar)))
    error("nchar must be a flag, NA, count or count range")

  check_n(x, n = nchar(x), range = nchar, x_name = x_name, n_name = "character", error = error)

  invisible(x)
}
