#' Check Data
#' 
#' Checks whether an object is a data frame. Can also check
#' the number of rows, the names and order and values of the columns as 
#' well as whether particular columns form a unique key.
#'
#' @inheritParams check_nrow
#' @param x The object to check.
#' @param values An optional character vector specifying the column names or a named list specifying the column names and values.
#' @param exclusive A flag indicating whether other columns are not permitted.
#' @param order A flag indicating whether the columns have to occur in the same order as values.
#' @param key A character vector of the columns that represent a unique key.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_colnames}}, \code{\link{check_nrow}} and \code{\link{check_key}} 
#' @export
#' 
#' @examples
#' z <- data.frame(
#'  Count = c(0L, 3L, 3L, 0L, NA), 
#'   Longitude = c(0, 0, 90, 90, 180), 
#'   Latitude = c(0, 90, 90.2, 100, -180),
#'   Type = factor(c("Good", "Bad", "Bad", "Bad", "Bad"), levels = c("Good", "Bad")),
#'   Extra = TRUE,
#'   Comments = c("In Greenwich", "Somewhere else", "I'm lost", 
#'     "I didn't see any", "Help"), 
#'   stringsAsFactors = FALSE)
#' 
#' check_data(z, values = list(
#'   Count = 1,
#'   Extra = NA,
#'   Latitude = c(45, 90)
#'   ), exclusive = TRUE, order = TRUE, nrow = 10L, key = "Longitude", error = FALSE)
check_data <- function(x,
                       values,
                       nrow = NA,
                       exclusive = FALSE,
                       order = FALSE,
                       key = character(0),
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_inherits(x, "data.frame", x_name = x_name)

  check_flag(error)
  
  if(!missing(values)) {
    if(is.list(values)) {
      check_colnames(x, colnames = names(values), x_name = x_name)
      check_colnames(x, colnames = names(values), x_name = x_name, 
                     exclusive = exclusive, order = order, error = error)

      for(name in names(values)) {
        check_values(x[[name]], values[[name]], 
                     x_name = paste("column", name, "of", x_name), error = error)
      }
    } else {
      if(!is.character(values)) err("values must be an character vector or a named list")
      
      check_colnames(x, colnames = values, x_name = x_name, exclusive = exclusive, order = order)
    }
  }
  check_nrow(x, nrow = nrow, x_name = x_name, error = error)
  
  check_key(x, key = key, x_name = x_name, error = error)
  
  invisible(x)
}
