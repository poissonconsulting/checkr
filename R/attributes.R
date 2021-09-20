#' Check Attributes
#'
#' Checks an objects attributes.
#'
#' @inheritParams check_list
#' @param names A flag specifying whether names should be considered an
#'   attribute.
#' @param class A flag specifying whether class should be considered an
#'   attribute.
#'
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_list}}
#' @export
#'
#' @examples
#' x <- 1
#' attributes(x) <- list(y = 2L)
#' check_attributes(x, values = list(y = 3:4), error = FALSE)
check_attributes <- function(x,
                             values = NULL,
                             exclusive = FALSE,
                             order = FALSE,
                             names = TRUE,
                             class = TRUE,
                             x_name = substitute(x),
                             error = TRUE) {
  lifecycle::deprecate_soft(
    "0.5.1", 
    "check_attributes()", 
    NULL,
    "Pull out attributes with `attr()` and then use appropriate chk function"
  )
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(names)
  check_flag_internal(class)
  check_flag_internal(error)
  
  attr <- attributes(x)
  
  if(!class) attr$class <- NULL
  if(!names) attr$names <- NULL
  
  if(!length(attr)) chk_fail(x_name, " must have attributes", error = error)
  
  if(!is.null(attr) && !is.null(values)) {
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
#' @inheritParams check_attributes
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_attributes}}
#' @export
#' 
#' @examples
#' x <- 1
#' attributes(x) <- list(y = 2L)
#' check_no_attributes(x, error = FALSE)
check_no_attributes <- function(x,
                                names = TRUE,
                                class = TRUE,
                                x_name = substitute(x),
                                error = TRUE) {
  lifecycle::deprecate_soft(
    "0.5.1", 
    "check_no_attributes()", 
    NULL,
    "Please use chk::chk_null(attributes()) instead"
  )
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(error)
  
  attr <- attributes(x)
  if(!class) attr$class <- NULL
  if(!names) attr$names <- NULL
  if(length(attr)) chk_fail(x_name, " must not have attributes", error = error)
  
  invisible(x)
}
