#' Check Unique
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_unique(2, error = FALSE)
#' check_unique(c(2,2), error = FALSE)
#' check_unique(1:2, error = FALSE)
#' check_unique(character(0), error = FALSE)
#' check_unique(NULL, error = FALSE)
#' check_unique(list(), error = FALSE)
check_unique <- function(x,
                         x_name = substitute(x),
                         error = getOption("vectorcheckr.error", TRUE)) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)
  check_flag_internal(error)

  if(anyDuplicated(x)) {
    on_fail(x_name, " must be unique", error = error)
  }
  invisible(x)
}
