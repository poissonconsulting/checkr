#' Check Names
#'
#' Checks the names of an object as returned by the `names()` function. 
#' The function can check the order of the names and whether other names are permitted.
#' 
#' @param x The object to check.
#' @param names A character vector of the names.
#' @param exclusive A flag indicating whether other names are not permitted.
#' @param order A flag indicating whether the object names have to occur in the same order as names.
#' @param unique A flag indicating whether all the object names have to be unique.
#' @param complete A flag indicating whether all the possible names have to be represented.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or 
#' immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_named}}
#' @export
#'
#' @examples
#' vec <- c(x = 1, y = 2, z = 0)
#' check_names(vec, c("y", "x"), error = FALSE)
#' check_names(vec, c("y", "x"), exclusive = TRUE, error = FALSE)
#' check_names(vec, c("y", "x"), order = TRUE, error = FALSE)
#' check_names(vec, c("a"), error = FALSE)
check_names <- function(x, names = character(0), exclusive = FALSE, order = FALSE,
                        unique = FALSE, complete = TRUE,
                        x_name = substitute(x),
                        error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_flag_internal(unique)
  check_vector(names, "", unique = unique)
  check_flag_internal(exclusive)
  check_flag_internal(order)
  check_flag_internal(complete)
  check_flag_internal(error)
  
  check_named(x, x_name = x_name, unique = unique, error = error)
  
  names(names) <- NULL
  x_names <- names(x)
  
  if(!length(names)) {
    if(exclusive && length(x_names))
      on_fail(x_name, " must not have any elements", error = error)
    return(x)
  }
  
  if (complete && length(setdiff(names, x_names)))
    on_fail(x_name, " names must include ", cc_and(setdiff(names, x_names)) , error = error)
  
  if (exclusive && length(setdiff(x_names, names)))
    on_fail(x_name, " names must not include ", cc_or(setdiff(x_names, names)) , error = error)
  
  if(order && !identical(intersect(names, x_names), intersect(x_names, names)))
    on_fail(x_name, " names must include ", cc_and(names), " in that order", error = error)
  
  invisible(x)
}
