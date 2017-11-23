#' Check Colnames
#'
#' @param x The data to check.
#' @param names A character vector of the column names.
#' @param exclusive A flag indicating whether other columns are permitted.
#' @param order A flag indicating whether the columns have to occur in the same order as colnames.
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
check_colnames <- function(x, names, exclusive = FALSE, order = FALSE,
                         x_name = substitute(x),
                         error = getOption("datacheckr.error", TRUE)) {

  if (!is.character(x_name)) x_name <- deparse(x_name)
  check_string_internal(x_name)

  check_names(x, names = names, exclusive = exclusive, order = order,
              x_name = x_name, error = error, names_name = "column names")
  invisible(x)
}
