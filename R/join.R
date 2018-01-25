#' Check Join
#' 
#' Checks that the columns in data frame x form a many-to-one
#' join with the corresponding columns in y.
#'
#' @param x The object to check.
#' @param y The parent data frame.
#' @param by A character vector or named character vector of the columns to join by. 
#' @param x_name A string of the name of the object x.
#' @param y_name A string of the name of the object y.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#' 
#' @examples
#' data1 <- data.frame(x = 1:2)
#' data2 <- data.frame(x = 3:5, y = 2L)
#' check_join(data1, data2, error = FALSE)
#' check_join(data1, data2, by = c(x = "y"), error = FALSE)
check_join <- function(x, y,
                       by = NULL,
                       x_name = substitute(x),
                       y_name = substitute(y),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)
  y_name <- deparse_y_name(y_name)
  
  check_data(x, x_name = x_name)
  check_data(y, x_name = y_name)
  check_flag_internal(error)
  
  checkor(check_null(by), check_vector(by, "", length = c(1, Inf)))
  
  if(is.null(by)) {
    by <- intersect(colnames(x), colnames(y))
    if (!length(by)) {
      on_fail(x_name, " and ", y_name, 
              " must have at least 1 matching column", error = TRUE)
    }
    names(by) <- by
  } else if(is.null(names(by))) names(by) <- by
    
  check_colnames(x, names(by), x_name = x_name, error = TRUE)
  check_colnames(y, by, x_name = y_name, error = TRUE)

  check_key(y, by, x_name = y_name, error = error)
  
  if(!nrow(x)) return(invisible(x))
  
  check_missing_colnames(x, "..ID")
  check_missing_colnames(y, "..ID")
  
  ..ID <- 1:nrow(x)
  
  x$..ID <- ..ID
  
  suppressWarnings(z <- merge(x, y, by.x = names(by), by.y = by))
  
  if(!identical(sort(unique(z$..ID)), sort(..ID))) {
        on_fail("join between ", x_name, " and ", y_name, " violates referential integrity", error = error)
  }
  x$..ID <- NULL
  invisible(x)
}
