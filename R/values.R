#' Check Vector Values
#'
#' @param x The object to check.
#' @param values A vector specifying the values.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_vector_values(2, c(3,4), error = FALSE)
#' check_vector_values(2, c(1,3), error = FALSE)
#' check_vector_values(2, c(1,3,4), error = FALSE)
#' check_vector_values(c(0L, 1L, 11L), 1:10, error = FALSE)
#' check_vector_values("t1", c("t0", "t2"), error = FALSE)
#' check_vector_values("t3", c("t0", "t2"), error = FALSE)
check_vector_values <- function(x,
                                values,
                                x_name = substitute(x),
                                error = getOption("vectorcheckr.error", TRUE)) {
  if (!is.character(x_name)) x_name <- deparse(x_name)

  check_string_internal(x_name)
  check_flag_internal(error)

  check_atomic(x, x_name = x_name, error = error)
  check_atomic(values)

  check_class(x, values, x_name = x_name, error = error)
  check_nas(x, values, x_name = x_name, error = error)

  x_nona <- x[!is.na(x)]
  if(!length(x_nona)) return(invisible(x))

  values <- values[!is.na(values)]
  if(length(values) < 2) return(invisible(x))

  x_nona <- sort(x_nona)
  values <- sort(values)

  if(identical(length(values), 2L)) {
    if(x_nona[1] < values[1] || x_nona[length(x_nona)] > values[2]) {
      on_fail("the values in ", x_name,
              " must lie between ", punctuate(values[1]), " and ", punctuate(values[2]), error = error)
    }
  } else if (!all(x_nona %in% values)) {
    unpermitted <- x_nona[!x_nona %in% values]
    unpermitted <- unique(unpermitted)
    values <- unique(values)
    if(length(values) < 10) {
      on_fail(x_name, " can only include values ", punctuate(values), error = error)
    } else if(length(unpermitted) < 10) {
      on_fail(x_name, " has unpermitted values ", punctuate(unpermitted, "and"), error = error)
    } else
      on_fail(x_name, " has unpermitted values ", error = error)
  }
  invisible(x)
}
