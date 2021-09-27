#' Check Row Bind
#'
#' Checks whether a data frame has the same columns of the same classes as a
#' second data frame which means they can be \code{\link{rbind}}ed without a
#' problem.
#'
#' @inheritParams params
#' @param x The first data frame.
#' @param y The second data frame.
#' @param order A flag indicating whether the columns have to occur in the same
#'   order.
#'
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_join}}
#' @export
#'
#' @examples
#' check_rbind(datasets::mtcars, datasets::mtcars)
check_rbind <- function(x,
                        y,
                        exclusive = TRUE,
                        order = FALSE,
                        x_name = substitute(x),
                        y_name = substitute(y),
                        error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_rbind()", "chk::check_data()")
  x_name <- chk_deparse(x_name)
  y_name <- chk_deparse(y_name)
  
  check_inherits(x, "data.frame", x_name = x_name)
  check_inherits(y, "data.frame", x_name = y_name)
  
  check_flag(exclusive)
  check_flag(order)
  check_flag(error)
  
  colnames <- intersect(colnames(y), colnames(x))
  if(exclusive) {
    check_colnames(x, colnames = colnames(y), 
                   exclusive = exclusive, order = order, x_name = x_name,
                   error = error)
  }
  
  if(!length(colnames)) return(invisible(x))
  
  else if(!exclusive && order) {
    if(!identical(colnames, intersect(colnames(x), colnames))) {
      chk_fail(co_and(colnames, "x column names must include %c in that order")
              , error = error)
    }
  }
  
  classes_x <- lapply(x[colnames], class)
  classes_y <- lapply(y[colnames], class)
  
  identical <- unlist(Map(identical, classes_x, classes_y))
  
  if(!all(identical)) {
    different <- names(identical[!identical])
    chk_fail(co_and(different, "column%s %c in "), x_name, " and ", y_name, 
                   " must have the same classes", error = error)
  }
  invisible(x)
}
