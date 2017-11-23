#' Check NAs
#'
#' @param x The object to check.
#' @param values A vector with no, some or all NAs.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_nas(NA, 1, error = FALSE)
#' check_nas(NA, NA, error = FALSE)
#' check_nas(1, NA, error = FALSE)
check_nas <- function(x,
                         values,
                         x_name = substitute(x),
                         error = getOption("vectorcheckr.error", TRUE)) {
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
