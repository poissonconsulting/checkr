#' Check Names
#'
#' @param x The object to check.
#' @param names A character vector of the names.
#' @param exclusive A flag indicating whether other names are permitted.
#' @param order A flag indicating whether the object names have to occur in the same order as names.
#' @param x_name A string of the name of the object.
#' @param names_name A string of the name of the names (used by datacheckr2::check_colnames).
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' vec <- c(x = 1, y = 2, z = 0)
#' check_names(vec, c("y", "x"), error = FALSE)
#' check_names(vec, c("y", "x"), exclusive = TRUE, error = FALSE)
#' check_names(vec, c("y", "x"), order = TRUE, error = FALSE)
#' check_names(vec, c("a"), error = FALSE)
check_names <- function(x, names, exclusive = FALSE, order = FALSE,
                         x_name = substitute(x), names_name = "names",
                         error = getOption("datacheckr.error", TRUE)) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_vector(names, "", min_length = 1, unique = FALSE, named = FALSE)
  check_flag_internal(exclusive)
  check_flag_internal(order)
  check_string_internal(x_name)
  check_flag_internal(error)
  
  check_named(x, x_name = x_name, error = error)

  x_names <- names(x)

  if (exclusive) {
    if (order) {
      if (!identical(x_names, names))
        on_fail(names_name, " in ", x_name, " must be identical to ", punctuate(names, "and"), error = error)
    } else {
      if (!identical(sort(x_names), sort(names)))
        on_fail(names_name, " in ", x_name, " must include and only include ", punctuate(names, "and"), error = error)
    }
  } else {
    x_names <- x_names[x_names %in% names]
    if (order) {
      if (!identical(x_names, names))
        on_fail(names_name, " in ", x_name, " must include in the following order ", punctuate(names, "and"), error = error)
    } else {
      if (!identical(sort(x_names), sort(names)))
        on_fail(names_name, " in ", x_name, " must include ", punctuate(names, "and"), error = error)
    }
  }
  invisible(x)
}

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

