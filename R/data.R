#' Check Data
#' 
#' Checks whether an object is a data frame. Can also check
#' the number of rows, the names and order and values of the columns as 
#' well as whether particular columns form a unique key.
#'
#' @inheritParams check_nrow
#' @inheritParams params
#' @param values NULL (default) or a character vector specifying the column names or a named list specifying the column names and values.
#' @param order A flag indicating whether the columns have to occur in the same order as values.
#' @param key A character vector of the columns that represent a unique key.
#' 
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
                       values = NULL,
                       nrow = NA,
                       exclusive = FALSE,
                       order = FALSE,
                       key = character(0),
                       x_name = substitute(x),
                       error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_data()", "chk::check_data()",
                            "Use chk::chk_data() for a faster version which returns NULL.")
  x_name <- chk_deparse(x_name)
  
  check_inherits(x, "data.frame", x_name = x_name)

  check_flag(error)
  
  if(!is.null(values)) {
    if(is.list(values)) {
      check_colnames(x, colnames = names(values), x_name = x_name)
      check_colnames(x, colnames = names(values), x_name = x_name, 
                     exclusive = exclusive, order = order, error = error)

      for(name in names(values)) {
        check_values(x[[name]], values[[name]], 
                     x_name = paste("column", name, "of", x_name), error = error)
      }
    } else {
      if(!is.character(values)) err("values must be a character vector, named list or NULL")
      
      check_colnames(x, colnames = values, x_name = x_name, exclusive = exclusive, order = order)
    }
  }
  check_nrow(x, nrow = nrow, x_name = x_name, error = error)
  
  check_key(x, key = key, x_name = x_name, error = error)
  
  invisible(x)
}
