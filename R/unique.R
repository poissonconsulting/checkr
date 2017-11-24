#' Check Unique
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_unique(2, error = FALSE)
#' check_unique(c(2,2), error = FALSE)
#' check_unique(1:2, error = FALSE)
#' check_unique(character(0), error = FALSE)
#' check_unique(NULL, error = FALSE)
#' check_unique(list(), error = FALSE)
check_unique <- function(x,
                         x_name = substitute(x),
                         error = TRUE) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)
  check_flag_internal(error)

  if(anyDuplicated(x)) {
    on_fail(x_name, " must be unique", error = error)
  }
  invisible(x)
}

#' Check Key
#'
#' Checks that columns in a data frame represent a unique key.
#'
#' By default all the columns are checked.
#'
#' @param x The data to check.
#' @param names A character vector of the column names representing the key.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' data <- data.frame(x = 1:1, y = 1:2)
#' check_key(data, "x", error = FALSE)
#' check_key(data, c("y", "x"), error = FALSE)
check_key <- function(x, names = names(x), x_name = substitute(x),
                      error = TRUE) {

  if (!is.character(x_name)) x_name <- deparse(x_name)
  check_string_internal(x_name)
  
  check_vector(names, "")

  if(!length(names)) return(invisible(x))

  check_colnames(x, names = names, x_name = x_name)

  if (anyDuplicated(x[names])) {
    on_fail(plural("column", length(names), " "),
            punctuate(names, "and"), " in ", x_name, " must be a unique key",
            error = error)
  }
  invisible(x)
}

