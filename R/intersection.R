#' Check Atomic Vector Intersection
#' 
#' Checks that all the elements in atomic vector x intersect with those in atomic vector y.
#'
#' @param x The object to check.
#' @param y The second atomic vector.
#' @param all_y A flag indicating whether all the elements in y should have a match in x.
#' @param x_name A string of the name of the object x.
#' @param y_name A string of the name of the object y.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_join}}
#' @export
#' 
#' @examples
#' x1 <- 1:3
#' x2 <- 1:4
#' check_intersection(x1, x2)
#' check_intersection(x2, x1, error = FALSE)
check_intersection <- function(x, y,
                       all_y = FALSE,
                       x_name = substitute(x),
                       y_name = substitute(y),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)
  y_name <- deparse_y_name(y_name)
  
  check_vector(x, x_name = x_name)
  check_vector(y, x_name = y_name)
  
  check_flag_internal(error)
  check_flag(all_y)
  
  if(length(setdiff(x, y))) 
    on_fail(y_name, " must include all the elements in ", x_name, error = error)
  if(all_y && length(setdiff(y, x))) 
    on_fail(x_name, " must include all the elements in ", y_name, error = error)
  
  invisible(x)
}
