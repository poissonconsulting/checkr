#' Check Number of Characters
#'
#' Checks the number of characters in the elements of an object.
#'
#' @inheritParams params
#' @param nchar A flag indicating whether x should have characters or a missing
#'   value indicating no requirements or a count or count range of the number of
#'   characters.
#'
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso [check_pattern()] and [check_regex()]
#' @export
#'
#' @examples
#' check_nchar(c("foo", "bar"), nchar = 3)
check_nchar <- function(x, 
                        nchar = TRUE, 
                        x_name = substitute(x),
                        error = TRUE) {
  lifecycle::deprecate_soft(
    "0.5.1", 
    "check_nchar()", 
    NULL, 
    "Please use chk::chk_equal(), chk::chk_range(), chk::chk_subset() etc with nchar() instead."
  )
  x_name <- chk_deparse(x_name)

  check_flag_internal(error)
  
  if(!(is_flag(nchar) || is_NA(nchar) || is_count(nchar) || is_count_range(nchar)))
    err("nchar must be a flag, NA, count or count range")

  check_n(x, n = nchar(x), range = nchar, x_name = x_name, n_name = "character", error = error)

  invisible(x)
}
