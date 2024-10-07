#' Check Number of Columns
#' 
#' Checks the number of columns of a data frame.
#'
#' @inheritParams check_length
#' @inheritParams params
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso [check_nrow()] and [check_data()] 
#' @export
#'
#' @examples
#' check_ncol(data.frame(x = 1), error = FALSE)
#' check_ncol(data.frame(x = 1:2), ncol = 1, error = FALSE)
check_ncol <- function(x, ncol = TRUE,
                         x_name = substitute(x),
                         error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_ncol()", "chk::check_dim()")
  x_name <- chk_deparse(x_name)

  check_length_internal(ncol)

  check_flag_internal(error)
  check_n(x, n = ncol(x), range = ncol, x_name = x_name, n_name = "column", error = error)
  invisible(x)
}
