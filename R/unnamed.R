#' Check Unnamed
#' 
#' Checks whether an objects is unnamed.
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
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
  x_name <- deparse_x_name(x_name)

  check_flag_internal(error)

  if(!is.null(names(x))) {
    chk_fail(x_name, " must be unnamed", error = error)
  }
  invisible(x)
}
