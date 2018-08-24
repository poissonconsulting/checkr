#' Check List
#' 
#' Checks whether an object is a list and optionally the names and values
#' of its elements.
#'
#' @inheritParams check_length
#' @inheritParams check_data
#' @param x The object to check.
#' @param values An optional vector or named list specifying the values.
#' @param exclusive A flag indicating whether other elements are not permitted.
#' @param order A flag indicating whether the elements have to occur in the same order as values.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_length}} and \code{\link{check_unique}}
#' @export
#' 
#' @examples
#' check_list(list())
#' check_list(list(x1 = 2, x2 = 1:2), values = list(x1 = 1, x2 = 1L))
check_list <- function(x,
                       values,
                       exclusive = FALSE,
                       order = FALSE,
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  if (!is.list(x)) err(x_name, " must be a list")
  
  check_flag_internal(error)
  
  if(!missing(values)) {
    if(is.list(values)) {
      check_named(values, unique = TRUE)
      check_names(x, names = names(values), exclusive = exclusive, order = order)
      
      for(name in names(values)) {
        check_values(x[[name]], values[[name]], x_name = paste("element", name, "of", x_name), error = error)
      }
    } else {
      if(!is.atomic(values)) err("values must be an atomic vector or a named list")
      check_names(x, names = values, exclusive = exclusive, order = order)
    }
  }
  invisible(x)
}
