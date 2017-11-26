#' Check Data
#'
#' @param x The object to check.
#' @param values An optional character vector specifying the column names or a named list specifying the column names and values.
#' @param min_nrow A count of the minimum number of rows
#' @param max_nrow A count of the maximum number of rows.
#' @param exclusive A flag indicating whether other columns are permitted.
#' @param order A flag indicating whether the columns have to occur in the same order as values.
#' @param key A character vector of the columns that represent a unique key.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
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
#'   ), exclusive = TRUE, order = TRUE, min_nrow = 10L, key = "Longitude", error = FALSE)
check_data <- function(x,
                       values,
                       min_nrow = 0L,
                       max_nrow = .Machine$integer.max,
                       exclusive = FALSE,
                       order = FALSE,
                       key = character(0),
                       x_name = substitute(x),
                       error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  if (!is.data.frame(x)) error(x_name, " must be a data frame")

  check_flag_internal(error)
  
  if(!missing(values)) {
    if(is.list(values)) {
      check_names(x, names = names(values))
      check_names(x, names = names(values), exclusive = exclusive, order = order, error = error)

      for(name in names(values)) {
        check_values(x[[name]], values[[name]], x_name = paste("column", name, "of", x_name), error = error)
      }
    } else {
      if(!is.character(values)) error("values must be an character vector or a named list")
      
      check_names(x, names = values, exclusive = exclusive, order = order)
    }
  }
  check_nrow(x, min_nrow = min_nrow, max_nrow = max_nrow,
             x_name = x_name, error = error)
  
  check_key(x, names = key, error = error)
  
  invisible(x)
}