#' Check Vector
#'
#' @param x The object to check.
#' @param values An optional vector specifying the values.
#' @param min_length A count of the minimum length.
#' @param max_length A count of the maximum length.
#' @param unique A flag indicating whether the values must be unique.
#' @param sorted A flag indicating whether the vector must be sorted.
#' @param named A flag (or NA) indicating whether the vector must be named or unnamed (or doesn't matter).
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_vector(2:1, min_length = 3, sorted = TRUE, named = TRUE, error = FALSE)
#' check_vector(c("one", "two", "four"), values = c("one", "two", "two"), error = FALSE)
check_vector <- function(x,
                         values,
                         min_length = 0L,
                         max_length = .Machine$integer.max,
                         unique = FALSE,
                         sorted = FALSE,
                         named = NA,
                         x_name = substitute(x),
                         error = getOption("vectorcheckr.error", TRUE)) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_count_internal(min_length)
  check_count_internal(max_length)
  check_flag_internal(unique)
  check_flag_internal(sorted)
  if(!(identical(named, TRUE) || identical(named, FALSE) || identical(named, NA))) {
     error("named must be a flag or NA")
  }

  check_string_internal(x_name)
  check_flag_internal(error)

  check_atomic(x, x_name = x_name, error = error)

  if(!missing(values))
    check_vector_values(x, values = values, x_name = x_name, error = error)

  check_length(x, min_length = min_length, max_length = max_length,
               x_name = x_name, error = error)

  if(unique) check_unique(x, x_name = x_name, error = error)
  if(sorted) check_sorted(x, x_name = x_name, error = error)
  if(identical(named, TRUE)) {
    check_named(x, x_name = x_name, error = error)
  } else if(identical(named, FALSE))
    check_unnamed(x, x_name = x_name, error = error)

  invisible(x)
}
