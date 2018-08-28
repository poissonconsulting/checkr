#' Check Atomic Vector
#'
#' @inheritParams check_length
#' @param x The object to check.
#' @param values An optional vector specifying the values.
#' @param unique A flag indicating whether the values must be unique.
#' @param sorted A flag indicating whether the vector must be sorted.
#' @param named A flag indicating whether the vector must be named or unnamed or NA if it doesn't matter.
#' @param attributes A flag indicating whether the vector must or must not have attributes or NA if it doesn't matter.
#' @param only A flag indicating whether only the actual values are permitted.
#' It only affects values with two or less non-missing elements.
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
                         attributes = named,
                         only = FALSE,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_flag_internal(unique)
  check_flag_internal(sorted)
  if(!(is_flag(named) || is_NA(named))) 
    err("named must be a flag or NA")

  if(!(is_flag(attributes) || is_NA(attributes))) 
    err("attributes must be a flag or NA")
  
  if(!is_NA(named) && named && !is_NA(attributes) && !attributes)
    err("names are attributes")

  check_flag_internal(only)
  check_flag_internal(error)
  
  if (!is.atomic(x)) err(x_name, " must be an atomic vector")
  
  check_length(x, length = length, x_name = x_name, error = error)
  
  if(!missing(values)) {
    check_values(x, values = values, only = only, 
                 x_name = x_name, error = error)
  } else if(only)
    wrn("only is TRUE but values is undefined")
  
  if(unique) check_unique(x, x_name = x_name, error = error)
  if(sorted) check_sorted(x, x_name = x_name, error = error)
  
  if(is_flag(named) && named) {
    check_named(x, x_name = x_name, error = error)
  } else if(is_flag(named) && !named)
    check_unnamed(x, x_name = x_name, error = error)
  
  if(is_flag(attributes) && attributes) {
    check_attributes(x, x_name = x_name, error = error)
  } else if(is_flag(attributes) && !attributes) {
    check_no_attributes(x, x_name = x_name, error = error)
  }
    
  invisible(x)
}
