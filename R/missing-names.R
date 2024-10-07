#' Check Missing Names
#'
#' Checks whether specific names are missing from an object.
#' 
#' @inheritParams params
#' @param x The named object to check.
#' @param names A character vector of the names that must be missing from x.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso [check_names()]
#' @export
#'
#' @examples
#' vec <- c(x = 1, y = 2, z = 0)
#' check_missing_names(vec, c("y", "x", "a"), error = FALSE)
#' check_missing_names(vec, "a", error = FALSE)
check_missing_names <- function(x, names, 
                                   x_name = substitute(x),
                                   error = TRUE) {
  lifecycle::deprecate_soft(
    "0.5.1", 
    "check_missing_names()", 
    NULL,
    "Please use chk::chk_not_subset(names()) instead."
  )
  
  x_name <- chk_deparse(x_name)
  
  check_named(x, x_name = x_name)
  
  check_vector(names, "", unique = TRUE, named = FALSE)
  check_flag_internal(error)

  if(!length(names)) return(invisible(x))

  x_names <- names(x)

  names <- intersect(names, x_names)
  
  if(length(names)) {
    chk_fail(x_name, co_and(names, " must not have name%s %c"), error = error)
  }
    
  invisible(x)
}
