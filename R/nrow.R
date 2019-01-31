#' Check Number of Rows
#' 
#' Checks the number of rows of a data frame.
#'
#' @inheritParams check_length
#' @param nrow A flag indicating whether x should have rows (versus no rows) or a missing value indicating no requirements or a count or count range of the number of rows.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_ncol}} and \code{\link{check_data}} 
#' @export
#'
#' @examples
#' check_nrow(data.frame(x = 1), error = FALSE)
#' check_nrow(data.frame(x = integer(0)), error = FALSE)
#' check_nrow(data.frame(x = 1:2), nrow = 1, error = FALSE)
check_nrow <- function(x, nrow = TRUE,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- chk_deparse(x_name)

  check_length_internal(nrow)

  check_flag_internal(error)
  
  check_n(x, n = nrow(x), range = nrow, x_name = x_name, n_name = "row", error = error)
  invisible(x)
}
