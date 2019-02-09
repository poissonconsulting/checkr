#' Check Key
#'
#' Checks that columns in a data frame represent a unique key.
#' By default all the columns are checked.
#'
#' @param x The data to check.
#' @param key A character vector of the column names representing the key.
#' @param na_distinct A flag specifying whether missing values should be considerd distinct.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
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

  x_name <- chk_deparse(x_name)

  check_vector(key, "")
  
  if(!length(key)) return(invisible(x))

  check_colnames(x, colnames = key, x_name = x_name)
  check_flag(na_distinct)
  
  incomparables <- if(na_distinct) NA else FALSE
  if (any(new_duplicated(x[key], incomparables = incomparables))) { 
    chk_fail(co(key, "column%s %c in ", conjunction = "and"), x_name, " must be a unique key",
            error = error)
  }
  invisible(x)
}
