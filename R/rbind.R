#' Check Row Bind
#' 
#' Checks whether a data frame has the same columns of the same classes as a second data frame which means they can be \code{\link{rbind}}ed without a problem.
#'
#' @param x The first data frame.
#' @param y The second data frame.
#' @param exclusive A flag indicating whether other columns are not permitted.
#' @param order A flag indicating whether the columns have to occur in the same order.
#' @param x_name A string of the name of the object x.
#' @param y_name A string of the name of the object y.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
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
      chk_fail(co(colnames, "x column names must include %c in that order",
                 conjunction = "and")
              , error = error)
    }
  }
  
  classes_x <- lapply(x[colnames], class)
  classes_y <- lapply(y[colnames], class)
  
  identical <- unlist(Map(identical, classes_x, classes_y))
  
  if(!all(identical)) {
    different <- names(identical[!identical])
    chk_fail(co(different, "column%s %c in ", conjunction = "and"), x_name, " and ", y_name, 
                   " must have the same classes", error = error)
  }
  invisible(x)
}
