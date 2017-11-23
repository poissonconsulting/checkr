#' Check List
#'
#' @param x The object to check.
#' @param values An optional vector or named list specifying the values.
#' @param min_length A count of the minimum length.
#' @param max_length A count of the maximum length.
#' @param unique A flag indicating whether the values must be unique.
#' @param sorted A flag indicating whether the list must be sorted.
#' @param named A flag (or NA) indicating whether the list must be named or unnamed (or doesn't matter).
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
check_list <- function(x,
                       values,
                       min_length = 0L,
                       max_length = .Machine$integer.max,
                       unique = FALSE,
                       sorted = FALSE,
                       named = NA,
                       x_name = substitute(x),
                       error = getOption("vectorcheckr.error", TRUE)) {
  if (!is.character(x_name)) x_name <- deparse(x_name)
  
  check_list_internal(x)

  if(!(identical(named, TRUE) || identical(named, FALSE) || identical(named, NA))) {
    error("named must be a flag or NA")
  }
  check_string_internal(x_name)
  check_flag_internal(error)
  
  if(!missing(values)) {
    
    if(is.list(values)) {
      check_named(values, unique = TRUE, error = TRUE)
      check_names(x, names = names(values), error = TRUE)
      
      for(name in names(values)) {
        check_class(x[[name]], values[[name]], x_name = paste("element", name, "of", x_name), error = error)
      }
      if(identical(named, FALSE)) {
        warning(x_name, " cannot be unnamed as named values supplied - setting named = TRUE")
        named <- TRUE
      }
    } else {
      if(!is.atomic(values)) error("values must be an atomic vector or a named list")
      
      for(name in names(x)) {
        check_class(x[[name]], values, x_name = paste("element", name, "of", x_name), error = error)
      }
    }
  }
  
  check_length(x, min_length = min_length, max_length = max_length,
               x_name = x_name, error = error)
  
  if(unique) check_unique(x, x_name = x_name, error = error)
  if(sorted) check_sorted(x, x_name = x_name, error = error)
  
  if(identical(named, TRUE)) {
    check_named(x, x_name = x_name, error = error)
  } else if(identical(named, FALSE))
    check_unnamed(x, x_name = x_name, error = error)
  
  invisible(x)
}
