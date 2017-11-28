#' Check Names
#'
#' @param x The object to check.
#' @param names A character vector of the names.
#' @param exclusive A flag indicating whether other names are permitted.
#' @param order A flag indicating whether the object names have to occur in the same order as names.
#' @param x_name A string of the name of the object.
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
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)

  check_vector(names, "", length = c(1L, .Machine$integer.max), unique = FALSE, named = FALSE)
  check_flag_internal(exclusive)
  check_flag_internal(order)
  check_flag_internal(error)
  
  check_named(x, x_name = x_name, error = error)

  x_names <- names(x)

  if (exclusive) {
    if (order) {
      if (!identical(x_names, names))
        on_fail(x_name, " names must be identical to ", punctuate(names, "and"), error = error)
    } else {
      if (!identical(sort(x_names), sort(names)))
        on_fail(x_name, " names must include and only include ", punctuate(names, "and"), error = error)
    }
  } else {
    x_names <- x_names[x_names %in% names]
    if (order) {
      if (!identical(x_names, names))
        on_fail(x_name, " names must include ", punctuate(names, "and"), " in that order", error = error)
    } else {
      if (!identical(sort(x_names), sort(names)))
        on_fail(x_name, " names must include ", punctuate(names, "and"), error = error)
    }
  }
  invisible(x)
}
