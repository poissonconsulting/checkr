check_class <- function(x,
                         values,
                         x_name = substitute(x),
                         error = getOption("vectorcheckr.error", TRUE)) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)
  check_flag_internal(error)

  class <- class(values)
  class <- class[length(class)]

  if (!inherits(x, class)) {
    on_fail(x_name, " must be class ", class, error = error)
  }
  invisible(x)
}
