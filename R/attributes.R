#' Check Attributes
#' 
#' Checks an objects attributes.
#'
#' @inheritParams check_list
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_list}}
#' @export
#' 
#' @examples
#' x <- 1
#' attributes(x) <- list(y = 2L)
#' check_attributes(x, values = list(y = 3:4), error = FALSE)
check_attributes <- function(x,
                             values,
                             exclusive = FALSE,
                             order = FALSE,
                             x_name = substitute(x),
                             error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_flag_internal(error)
  
  attr <- attributes(x)
  if(is.null(attr)) on_fail(x_name, " must have attributes", error = error)
  
  if(!is.null(attr) && !missing(values)) {
    check_list(attr, values = values, order = order, exclusive = exclusive, 
               x_name = paste("attributes of", x_name), error = error)
  }
  
  invisible(x)
}

#' Check No Attributes
#' 
#' Checks an object has no attributes.
#'
#' @inheritParams check_list
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_attributes}}
#' @export
#' 
#' @examples
#' x <- 1
#' attributes(x) <- list(y = 2L)
#' check_no_attributes(x, error = FALSE)
check_no_attributes <- function(x,
                             x_name = substitute(x),
                             error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_flag_internal(error)
  
  
  attr <- attributes(x)
  if(!is.null(attr)) on_fail(x_name, " must not have attributes", error = error)

  invisible(x)
}
