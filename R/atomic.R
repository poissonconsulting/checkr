#' Check Atomic
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_atomic(1)
#' check_atomic(character(0))
#' check_atomic(NULL)
#' check_atomic(Sys.Date())
#' check_atomic(Sys.time())
#' check_atomic(list(), error = FALSE)
#' x <- 1
#' names(x) <- "y"
#' check_atomic(x)
check_atomic <- function(x,
                         x_name = substitute(x),
                         error = getOption("vectorcheckr.error", TRUE)) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)
  check_flag_internal(error)

  if (!is.atomic(x)) {
    on_fail(x_name, " must be an atomic vector", error = error)
  }
  invisible(x)
}
