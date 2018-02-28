#' Check List
#'
#' @inheritParams check_length
#' @param x The object to check.
#' @param values An optional vector or named list specifying the values.
#' @param unique A flag indicating whether the values must be unique.
#' @param sorted A flag indicating whether the list must be sorted.
#' @param named A flag indicating whether the list must be named or unnamed or a regular expression that must match all the names or NA if it doesn't matter if the list is named.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
check_list <- function(x,
                       values,
                       length = NA,
                       unique = FALSE,
                       sorted = FALSE,
                       named = NA,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  if (!is.list(x)) error(x_name, " must be a list")

  if(!(is_flag(named) || is_string(named) || is_NA(named))) 
    error("named must be a flag a string or NA")
  
  regex <- ".*"
  if(is_string(named)) {
    regex <- named
    named <- TRUE
  }
  
  check_flag_internal(error)
  
  if(!missing(values)) {
    
    if(is.list(values)) {
      check_named(values, unique = TRUE)
      check_names(x, names = names(values))
      
      for(name in names(values)) {
        check_class_internal(x[[name]], values[[name]], x_name = paste("element", name, "of", x_name), error = error)
      }
      if(identical(named, FALSE)) {
        warning(x_name, " cannot be unnamed as named values supplied - setting named = TRUE")
        named <- TRUE
      }
    } else {
      if(!is.atomic(values)) error("values must be an atomic vector or a named list")
      
      for(name in names(x)) {
        check_values(x[[name]], values, x_name = paste("element", name, "of", x_name), error = error)
      }
    }
  }
  
  check_length(x, length = length, x_name = x_name, error = error)
  
  if(unique) check_unique(x, x_name = x_name, error = error)
  if(sorted) check_sorted(x, x_name = x_name, error = error)
  
  if(is_flag(named) && named) {
    check_named(x, regex = regex, x_name = x_name, error = error)
  } else if(is_flag(named) && !named)
    check_unnamed(x, x_name = x_name, error = error)
  
  invisible(x)
}
