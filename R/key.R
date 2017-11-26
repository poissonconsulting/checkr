#' Check Key
#'
#' Checks that columns in a data frame represent a unique key.
#'
#' By default all the columns are checked.
#'
#' @param x The data to check.
#' @param key A character vector of the column names representing the key.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' data <- data.frame(x = 1:1, y = 1:2)
#' check_key(data, "x", error = FALSE)
#' check_key(data, c("y", "x"), error = FALSE)
check_key <- function(x, key = names(x), x_name = substitute(x),
                      error = TRUE) {

  x_name <- deparse_x_name(x_name)

  check_vector(key, "")

  if(!length(key)) return(invisible(x))

  check_colnames(x, colnames = key, x_name = x_name)

  if (anyDuplicated(x[key])) {
    on_fail(plural("column", length(key), " "),
            punctuate(key, "and"), " in ", x_name, " must be a unique key",
            error = error)
  }
  invisible(x)
}
