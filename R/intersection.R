#' Check Atomic Vector Intersection
#' 
#' Checks that all the elements in atomic vector x intersect with those in atomic vector y.
#' 
#' @inheritParams params
#' @param y The second atomic vector.
#' @param all_y A flag indicating whether all the elements in y should have a match in x.
#' 
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
  lifecycle::deprecate_soft("0.5.1", "check_intersection()", NULL)
  x_name <- chk_deparse(x_name)
  y_name <- chk_deparse(y_name)
  
  check_vector(x, x_name = x_name)
  check_vector(y, x_name = y_name)
  
  check_flag_internal(error)
  check_flag(all_y)
  
  if(length(setdiff(x, y))) 
    chk_fail(y_name, " must include all the elements in ", x_name, error = error)
  if(all_y && length(setdiff(y, x))) 
    chk_fail(x_name, " must include all the elements in ", y_name, error = error)
  
  invisible(x)
}
