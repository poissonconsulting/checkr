#' Check Colnames
#' 
#' Checks the column names of a data frame as returned by the `colnames()` function. 
#' The function can check the order of the columns and whether other columns are permitted.
#' 
#' @inheritParams params
#' @param x The data to check.
#' @param order A flag indicating whether the columns have to occur in the same order as colnames.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso [check_missing_colnames()] and [check_data()]
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
  lifecycle::deprecate_soft("0.5.1", "check_colnames()", "chk::check_data()")

  x_name <- chk_deparse(x_name)

  check_vector(colnames, "", unique = TRUE)
  check_flag_internal(exclusive)
  check_flag_internal(order)
  check_flag_internal(error)

  names(colnames) <- NULL
  x_colnames <- colnames(x)
  
  if(is.null(x_colnames)) chk_fail(x_name, " must have column names", error = error)
  
  if(!length(colnames)) {
    if(exclusive && length(x_colnames))
        chk_fail(x_name, " must not have any columns", error = error)
    return(x)
  }

  if (exclusive) {
    if (order) {
      if (!identical(x_colnames, colnames))
        chk_fail(x_name, " column names must be identical to ", cc_and(colnames), error = error)
    } else {
      if (!identical(sort(x_colnames), sort(colnames)))
        chk_fail(x_name, " column names must include and only include ", cc_and(colnames), error = error)
    }
  } else {
    x_colnames <- x_colnames[x_colnames %in% colnames]
    if (order) {
      if (!identical(x_colnames, colnames))
        chk_fail(x_name, " column names must include ", cc_and(colnames), " in that order", error = error)
    } else {
      if (!identical(sort(x_colnames), sort(colnames)))
        chk_fail(x_name, " column names must include ", cc_and(colnames), error = error)
    }
  }
  invisible(x)
}
