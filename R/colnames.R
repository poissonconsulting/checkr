#' Check Colnames
#'
#' @param x The data to check.
#' @param colnames A character vector of the column names.
#' @param exclusive A flag indicating whether other columns are not permitted.
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
check_colnames <- function(x, colnames = character(0), exclusive = FALSE, order = FALSE,
                         x_name = substitute(x),
                         error = TRUE) {

  x_name <- deparse_x_name(x_name)

  check_vector(colnames, "", unique = TRUE)
  check_flag_internal(exclusive)
  check_flag_internal(order)
  check_flag_internal(error)

  names(colnames) <- NULL
  x_colnames <- colnames(x)
  
  if(is.null(x_colnames)) on_fail(x_name, " must have column names", error = error)
  
  if(!length(colnames)) {
    if(exclusive && length(x_colnames))
        on_fail(x_name, " must not have any columns", error = error)
    return(x)
  }

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
