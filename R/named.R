#' Check Named
#'
#' @param x The object to check.
#' @param unique A flag indicating whether the names must be unique.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_named(2, error = FALSE)
#' x <- 1
#' names(x) <- "y"
#' check_named(x, error = FALSE)
check_named <- function(x, unique = FALSE,
                         x_name = substitute(x),
                         error = TRUE) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_flag(unique)
  check_string_internal(x_name)
  check_flag_internal(error)

  if(is.null(names(x))) {
    on_fail(x_name, " must be named", error = error)
  }
  check_unique(names(x), x_name = paste("names of", x_name), error = error)
  invisible(x)
}

#' Check Unnamed
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
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
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)
  check_flag_internal(error)

  if(!is.null(names(x))) {
    on_fail(x_name, " must be unnamed", error = error)
  }
  invisible(x)
}

