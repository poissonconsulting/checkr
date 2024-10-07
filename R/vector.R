#' Check Atomic Vector
#'
#' @inheritParams check_length
#' @inheritParams params
#' @inheritParams check_attributes
#' @param named A flag indicating whether the vector must be named or unnamed or NA if it doesn't matter.
#' @param attributes A flag indicating whether the vector must or must not have attributes or NA if it doesn't matter.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_vector(2:1, length = 3, sorted = TRUE, named = TRUE, error = FALSE)
#' check_vector(c("one", "two", "four"), values = c("one", "two", "two"), error = FALSE)
check_vector <- function(x,
                         values = NULL,
                         length = NA,
                         unique = FALSE,
                         sorted = FALSE,
                         named = NA,
                         attributes = named,
                         names = TRUE,
                         class = TRUE,
                         only = FALSE,
                         x_name = substitute(x),
                         error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_vector()", NULL,
                            "Please use chk::chk_vector(), chk::check_dim(), chk::chk_unique(), chk::chk_sorted(), chk::chk_named(), and/or chk::check_values() instead.")
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(unique)
  check_flag_internal(sorted)
  check_flag_internal(names)

  if(!(is_flag(named) || is_NA(named))) 
    err("named must be a flag or NA")
  
  if(!(is_flag(attributes) || is_NA(attributes))) 
    err("attributes must be a flag or NA")
  
  if(!is_NA(named) && named && !is_NA(attributes) && !attributes && names)
    err("names are attributes")
  
  check_flag_internal(only)
  check_flag_internal(error)
  
  if (is.null(x) || !is.atomic(x)) err(x_name, " must be an atomic vector")
  
  check_length(x, length = length, x_name = x_name, error = error)
  
  if(!is.null(values)) {
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
    check_attributes(x, names = names, class = class, x_name = x_name, error = error)
  } else if(is_flag(attributes) && !attributes) {
    check_no_attributes(x, names = names, class = class, x_name = x_name, error = error)
  }
  
  invisible(x)
}
