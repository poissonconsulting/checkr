#' Check Key
#'
#' Checks that columns in a data frame represent a unique key.
#' By default all the columns are checked.
#'
#' @inheritParams params
#' @param x The data to check.
#' @param key A character vector of the column names representing the key.
#' 
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_data}}
#' @export
#'
#' @examples
#' data <- data.frame(x = 1:1, y = 1:2)
#' check_key(data, "x", error = FALSE)
#' check_key(data, c("y", "x"), error = FALSE)
check_key <- function(x, key = names(x), na_distinct = FALSE,
                      x_name = substitute(x),
                      error = TRUE) {
  lifecycle::deprecate_soft("0.5.1", "check_key()", "chk::check_key()")

  x_name <- chk_deparse(x_name)

  check_vector(key, "")
  
  if(!nrow(x)) return(x)
  
  if(!length(key)) return(invisible(x))

  check_colnames(x, colnames = key, x_name = x_name)
  check_flag(na_distinct)
  
  incomparables <- if(na_distinct) NA else FALSE
  if (any(new_duplicated(x[key], incomparables = incomparables))) { 
    chk_fail(co_and(key, "column%s %c in "), x_name, " must be a unique key",
            error = error)
  }
  invisible(x)
}
