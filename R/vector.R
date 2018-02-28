#' Check Vector
#'
#' @inheritParams check_length
#' @param x The object to check.
#' @param values An optional vector specifying the values.
#' @param unique A flag indicating whether the values must be unique.
#' @param sorted A flag indicating whether the vector must be sorted.
#' @param named A flag indicating whether the vector must be named or unnamed or a regular expression that must match all the names or count or count range of the number of characters in the names or NA if it doesn't matter if the vector is named.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_vector(2:1, length = 3, sorted = TRUE, named = TRUE, error = FALSE)
#' check_vector(c("one", "two", "four"), values = c("one", "two", "two"), error = FALSE)
check_vector <- function(x,
                         values,
                         length = NA,
                         unique = FALSE,
                         sorted = FALSE,
                         named = NA,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_flag_internal(unique)
  check_flag_internal(sorted)
  if(!(is_flag(named) || is_string(named) || is_NA(named) || is_count(named) || is_count_range(named))) 
    error("named must be a flag, string, count, count range or NA")
  
  regex <- ".*"
  nchar <- c(0L, .Machine$integer.max)
  if(is_string(named)) {
    regex <- named
    named <- TRUE
  } else if(is_count(named) || is_count_range(named)) {
    nchar <- named
    named <- TRUE
  }
  
  check_flag_internal(error)
  
  if (!is.atomic(x)) error(x_name, " must be an atomic vector")
  
  check_length(x, length = length, x_name = x_name, error = error)
  
  if(!missing(values))
    check_values(x, values = values, x_name = x_name, error = error)
  
  if(unique) check_unique(x, x_name = x_name, error = error)
  if(sorted) check_sorted(x, x_name = x_name, error = error)
  
  if(is_flag(named) && named) {
    check_named(x, nchar = nchar, regex = regex, x_name = x_name, error = error)
  } else if(is_flag(named) && !named)
    check_unnamed(x, x_name = x_name, error = error)
  
  invisible(x)
}
