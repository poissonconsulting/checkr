#' Check Classes
#' 
#' Checks that an object inherits from one or more classes.
#' 
#' The classes of an object can be returned using the `class()` function.
#'
#' @param x The object to check.
#' @param classes A character vector of the classes x should inherit from.
#' @param exclusive A flag indicating whether other classes are not permitted.
#' @param order A flag indicating whether the object classes have to occur in the same order as classes.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{check_inherits}}
#' @export
#'
#' @examples
#' check_classes(list())
#' check_classes(list(), "list")
#' check_classes(list(), "numeric", error = FALSE)
check_classes <- function(x, classes = character(0),
                     exclusive = FALSE,
                     order = FALSE,
                     x_name = substitute(x),
                     error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_vector(classes, "", unique = TRUE)
  check_flag_internal(exclusive)
  check_flag_internal(order)
  check_flag_internal(error)
  
  names(classes) <- NULL
  x_classes <- class(x)
  
  if(!length(classes) && exclusive) 
    error("all objects must have a class (define classes or set exclusive = FALSE)")
  
  if (identical(length(classes), 1L) && !exclusive) {
    check_inherits(x, classes, x_name = x_name, error = error)
    return(invisible(x))
  }
    
  if (exclusive) {
    if (order) {
      if (!identical(x_classes, classes))
        on_fail(x_name, " classes must be identical to ", cc_and(classes), error = error)
    } else {
      if (!identical(sort(x_classes), sort(classes)))
        on_fail(x_name, " classes must include and only include ", cc_and(classes), error = error)
    }
  } else {
    x_classes <- x_classes[x_classes %in% classes]
    if (order) {
      if (!identical(x_classes, classes))
        on_fail(x_name, " classes must include ", cc_and(classes), " in that order", error = error)
    } else {
      if (!identical(sort(x_classes), sort(classes)))
        on_fail(x_name, " classes must include ", cc_and(classes), error = error)
    }
  }
  invisible(x)
}
