#' Check Join
#' 
#' Checks that the columns in data frame x form a many-to-one
#' join with the corresponding columns in y, ie, 
#' the join is a unique key in y and all the rows in x have a match in y.
#'
#' @param x The object to check.
#' @param y The parent data frame.
#' @param by A character vector or named character vector of the columns to join by. 
#' @param all_y A flag indicating whether all the rows in y should have a match in x.
#' @param x_name A string of the name of the object x.
#' @param y_name A string of the name of the object y.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_data}}
#' @export
#' 
#' @examples
#' data1 <- data.frame(x = 1:2)
#' data2 <- data.frame(x = 3:5, y = 2L)
#' check_join(data1, data2, error = FALSE)
#' check_join(data1, data2, by = c(x = "y"), error = FALSE)
check_join <- function(x, y,
                       by = NULL,
                       all_y = FALSE,
                       x_name = substitute(x),
                       y_name = substitute(y),
                       error = TRUE) {
  x_name <- chk_deparse(x_name)
  y_name <- chk_deparse(y_name)
  
  check_data(x, x_name = x_name)
  check_data(y, x_name = y_name)
  check_flag_internal(error)
  
  checkor(check_null(by), check_vector(by, "", length = TRUE))
  check_flag(all_y)
  
  if(is.null(by)) {
    by <- intersect(colnames(x), colnames(y))
    if (!length(by)) {
      chk_fail(x_name, " and ", y_name, 
              " must have at least 1 matching column", error = TRUE)
    }
    names(by) <- by
  } else if(is.null(names(by))) names(by) <- by
    
  check_colnames(x, names(by), x_name = x_name, error = TRUE)
  check_colnames(y, by, x_name = y_name, error = TRUE)

  check_key(y, by, x_name = y_name, error = error)
  
  if(!all_y && !nrow(x)) return(invisible(x))
  
  check_missing_colnames(x, "..ID")
  check_missing_colnames(y, "..ID")
  
  ..ID.x <- seq_len(nrow(x))
  ..ID.y <- seq_len(nrow(y))
  
  x$..ID.x <- ..ID.x
  y$..ID.y <- ..ID.y
  
  suppressWarnings(z <- merge(x, y, by.x = names(by), by.y = by))
  
  if(!identical(sort(unique(z$..ID.x)), sort(..ID.x))) {
        chk_fail("join between ", x_name, " and ", y_name, " must include all the rows in ", x_name, error = error)
  }
  if(all_y && !identical(sort(unique(z$..ID.y)), sort(..ID.y))) {
        chk_fail("join between ", x_name, " and ", y_name, " must include all the rows in ", y_name, error = error)
  }
  
  x$..ID.x <- NULL
  invisible(x)
}
