#' Check Unnamed
#' 
#' Checks whether an objects is unnamed.
#'
#' @inheritParams params
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_named}}, \code{\link{check_names}} and \code{\link{check_missing_names}}
#' @export
#'
#' @examples
#' check_unnamed(2, error = FALSE)
#' x <- 1
#' names(x) <- "y"
#' check_unnamed(x, error = FALSE)
check_unnamed <- function(x,
                         x_name = substitute(x),
                         error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_unnamed()", NULL,
                            "Please use chk::check_named() or chk::check_not_empty() instead. 
Use chk::chk_named() and chk::chk_not_empty() for faster versions which return NULL.")
  x_name <- chk_deparse(x_name)

  check_flag_internal(error)

  if(!is.null(names(x))) {
    chk_fail(x_name, " must be unnamed", error = error)
  }
  invisible(x)
}
