check_nas <- function(x,
                         values,
                         x_name = substitute(x),
                         error = TRUE) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)
  check_flag_internal(error)

  if(!length(values)) return(invisible(x))

  nas <- is.na(values)

  if(!length(nas)) return(invisible(x))

  if(!any(nas) && any(is.na(x))) {
    on_fail(x_name, " must not include missing values", error = error)
  } else if (all(nas) && !all(is.na(x))) {
    on_fail(x_name, " must only include missing values", error = error)
  }
  invisible(x)
}
