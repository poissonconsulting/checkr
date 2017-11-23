#' Check List
#'
#' @param x The object to check.
#' @param values An optional vector specifying the values.
#' @param min_length A count of the minimum length.
#' @param max_length A count of the maximum length.
#' @param named A flag (or NA) indicating whether the list must be named or unnamed (or doesn't matter).
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' x <- list(x = 1, y = 2)
#' check_list(1:2, error = FALSE)
#' check_list(list(x = 1, y = 2), named = TRUE, error = FALSE)
check_list <- function(x,
                         values,
                         min_length = 0L,
                         max_length = .Machine$integer.max,
                         named = NA,
                         x_name = substitute(x),
                         error = getOption("vectorcheckr.error", TRUE)) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_count_internal(min_length)
  check_count_internal(max_length)
  if(!(identical(named, TRUE) || identical(named, FALSE) || identical(named, NA))) {
     error("named must be a flag or NA")
  }

  check_string_internal(x_name)
  check_flag_internal(error)

  if(!is.list(x)) {
    on_fail("x must be a list", error = error)
    return(invisible(x))
  }

#  if(!missing(values))
#    check_list_values(x, values = values, x_name = x_name, error = error)

  check_length(x, min_length = min_length, max_length = max_length,
               x_name = x_name, error = error)

  if(identical(named, TRUE)) {
    check_named(x, x_name = x_name, error = error)
  } else if(identical(named, FALSE))
    check_unnamed(x, x_name = x_name, error = error)

  invisible(x)
}
