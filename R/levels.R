#' Check Levels
#'
#' @param x The object to check.
#' @param levels A character vector of the levels.
#' @param exclusive A flag indicating whether other levels are permitted.
#' @param order A flag indicating whether the object levels have to occur in the same order as names. To check whether x is an ordered factor use
#' \code{check_vector(x, ordered(1))}.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_levels(1, c("x", "y"), error = FALSE)
#' check_levels(factor(1), c("x", "y"), error = FALSE)
check_levels <- function(x, levels, exclusive = TRUE, order = TRUE,
                         x_name = substitute(x),
                         error = getOption("checkr.error", TRUE)) {
  x_name <- deparse_x_name(x_name)

  check_vector(levels, "", min_length = 1, unique = FALSE, named = FALSE)
  check_flag_internal(exclusive)
  check_flag_internal(order)
  check_flag_internal(error)
  
  x_levels <- levels(x)
  
  if(is.null(x_levels)) on_fail(x_name, " must have a levels attribute", error = error)

  if (exclusive) {
    if (order) {
      if (!identical(x_levels, levels))
        on_fail(x_name, " levels must be identical to ", punctuate(levels, "and"), error = error)
    } else {
      if (!identical(sort(x_levels), sort(levels)))
        on_fail(x_name, " levels must include and only include ", punctuate(levels, "and"), error = error)
    }
  } else {
    x_levels <- x_levels[x_levels %in% levels]
    if (order) {
      if (!identical(x_levels, levels))
        on_fail(x_name, " levels must include ", punctuate(levels, "and"), " in that order", error = error)
    } else {
      if (!identical(sort(x_levels), sort(levels)))
        on_fail(x_name, " levels must include ", punctuate(levels, "and"), error = error)
    }
  }
  invisible(x)
}
