#' Check Levels
#' 
#' Checks the levels in a factor including the order and 
#' whether other levels are permitted.
#'
#' @inheritParams params
#' @param exclusive A flag indicating whether other levels are not permitted.
#' @param order A flag indicating whether the object levels have to occur in the same order as names. To check whether x is an ordered factor use
#' `check_vector(x, ordered(1))`.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso [check_nlevels()] and [check_vector()]
#' @export
#'
#' @examples
#' check_levels(1, c("x", "y"), error = FALSE)
#' check_levels(factor(1), c("x", "y"), error = FALSE)
check_levels <- function(x, levels, exclusive = TRUE, order = TRUE,
                         x_name = substitute(x),
                         error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_levels()", "chk::check_data()")
  x_name <- chk_deparse(x_name)

  check_vector(levels, "", length = c(1L, chk_max_int()), unique = FALSE, named = FALSE)
  check_flag_internal(exclusive)
  check_flag_internal(order)
  check_flag_internal(error)
  
  x_levels <- levels(x)
  
  if(is.null(x_levels)) chk_fail(x_name, " must have a levels attribute", error = error)

  if (exclusive) {
    if (order) {
      if (!identical(x_levels, levels))
        chk_fail(x_name, " levels must be identical to ", cc_and(levels), error = error)
    } else {
      if (!identical(sort(x_levels), sort(levels)))
        chk_fail(x_name, " levels must include and only include ", cc_and(levels), error = error)
    }
  } else {
    x_levels <- x_levels[x_levels %in% levels]
    if (order) {
      if (!identical(x_levels, levels))
        chk_fail(x_name, " levels must include ", cc_and(levels), " in that order", error = error)
    } else {
      if (!identical(sort(x_levels), sort(levels)))
        chk_fail(x_name, " levels must include ", cc_and(levels), error = error)
    }
  }
  invisible(x)
}
