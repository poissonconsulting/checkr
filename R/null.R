#' Check NULL
#' 
#' Checks whether an object is NULL.
#'
#' @inheritParams params
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_null(1, error = FALSE)
#' check_null(NULL, error = FALSE)
check_null <- function(x,
                         x_name = substitute(x),
                         error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_null()", "chk::check_null()",
                            "Use chk::chk_null() for a faster version which returns NULL.")
  x_name <- chk_deparse(x_name)

  check_flag_internal(error)

  if (!is.null(x)) chk_fail(x_name, " must be NULL", error = error)
  invisible(x)
}
