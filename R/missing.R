#' Check Missing Colnames
#'
#' @param x The data to check.
#' @param colnames A character vector of the column names that must be missing from x.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' data <- data.frame(x = 1, y = 2, z = 0)
#' check_missing_colnames(data, c("y", "x", "a"), error = FALSE)
#' check_missing_colnames(data, "a", error = FALSE)
check_missing_colnames <- function(x, colnames, 
                                   x_name = substitute(x),
                                   error = TRUE) {
  
  x_name <- deparse_x_name(x_name)
  
  check_vector(colnames, "", unique = TRUE, named = FALSE)
  check_flag_internal(error)

  if(!length(colnames)) return(invisible(x))

  x_colnames <- colnames(x)
  
  if(is.null(x_colnames)) on_fail(x_name, " must have column names", error = error)
  
  colnames <- intersect(colnames, x_colnames)
  
  if(length(colnames)) {
    on_fail(x_name, " must not have ", plural("column", length(colnames), " "), punctuate(sort(colnames), "and"), error = error)
  }
    
  invisible(x)
}

#' Check Missing Names
#'
#' @param x The named object to check.
#' @param names A character vector of the names that must be missing from x.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' vec <- c(x = 1, y = 2, z = 0)
#' check_missing_names(vec, c("y", "x", "a"), error = FALSE)
#' check_missing_names(vec, "a", error = FALSE)
check_missing_names <- function(x, names, 
                                   x_name = substitute(x),
                                   error = TRUE) {
  
  x_name <- deparse_x_name(x_name)
  
  check_named(x, x_name = x_name)
  
  check_vector(names, "", unique = TRUE, named = FALSE)
  check_flag_internal(error)

  if(!length(names)) return(invisible(x))

  x_names <- names(x)

  names <- intersect(names, x_names)
  
  if(length(names)) {
    on_fail(x_name, " must not have ", plural("name", length(names), " "), punctuate(sort(names), "and"), error = error)
  }
    
  invisible(x)
}

