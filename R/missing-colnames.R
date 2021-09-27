#' Check Missing Colnames
#' 
#' Checks whether specific colnames are missing from a data frame.
#'
#' @inheritParams params
#' @param x The data to check.
#' @param colnames A character vector of the column names that must be missing from x.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_colnames}} and \code{\link{check_data}}
#' @export
#'
#' @examples
#' data <- data.frame(x = 1, y = 2, z = 0)
#' check_missing_colnames(data, c("y", "x", "a"), error = FALSE)
#' check_missing_colnames(data, "a", error = FALSE)
check_missing_colnames <- function(x, colnames, 
                                   x_name = substitute(x),
                                   error = TRUE) {
  lifecycle::deprecate_soft(
    "0.5.1", 
    "check_missing_colnames()", 
    NULL, 
    "Please use chk::chk_not_subset(names()) instead."
  )
  
  x_name <- chk_deparse(x_name)
  
  check_vector(colnames, "", unique = TRUE, named = FALSE)
  check_flag_internal(error)

  if(!length(colnames)) return(invisible(x))

  x_colnames <- colnames(x)
  
  if(is.null(x_colnames)) chk_fail(x_name, " must have column names", error = error)
  
  colnames <- intersect(colnames, x_colnames)
  
  if(length(colnames)) {
    chk_fail(x_name, co_and(sort(colnames), " must not have column%s %c"), error = error)
  }
    
  invisible(x)
}
