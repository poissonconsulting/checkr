#' Check Colnames
#'
#' @param x The data to check.
#' @param colnames A character vector of the column names.
#' @param exclusive A flag indicating whether other columns are permitted.
#' @param order A flag indicating whether the columns have to occur in the same order as names.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' data <- data.frame(x = 1, y = 2, z = 0)
#' check_colnames(data, c("y", "x"), error = FALSE)
#' check_colnames(data, c("y", "x"), exclusive = TRUE, error = FALSE)
#' check_colnames(data, c("y", "x"), order = TRUE, error = FALSE)
#' check_colnames(data, c("a"), error = FALSE)
check_colnames <- function(x, colnames, exclusive = FALSE, order = FALSE,
                         x_name = substitute(x),
                         error = getOption("checkr.error", TRUE)) {

  x_name <- deparse_x_name(x_name)

  check_vector(colnames, "", min_length = 1, unique = FALSE, named = FALSE)
  check_flag_internal(exclusive)
  check_flag_internal(order)
  check_flag_internal(error)
  
  check_named(x, x_name = x_name, error = error)

  x_colnames <- colnames(x)
  
  if(is.null(x_colnames)) on_fail(x_name, " must have column names", error = error)

  if (exclusive) {
    if (order) {
      if (!identical(x_colnames, colnames))
        on_fail(x_name, " column names must be identical to ", punctuate(colnames, "and"), error = error)
    } else {
      if (!identical(sort(x_colnames), sort(colnames)))
        on_fail(x_name, " column names must include and only include ", punctuate(colnames, "and"), error = error)
    }
  } else {
    x_colnames <- x_colnames[x_colnames %in% colnames]
    if (order) {
      if (!identical(x_colnames, colnames))
        on_fail(x_name, " column names must include ", punctuate(colnames, "and"), " in that order", error = error)
    } else {
      if (!identical(sort(x_colnames), sort(colnames)))
        on_fail(x_name, " column names must include ", punctuate(colnames, "and"), error = error)
    }
  }
  invisible(x)
}
