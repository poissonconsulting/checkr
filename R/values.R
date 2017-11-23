check_values <- function(x, values,
                         x_name = substitute(x),
                         error = getOption("vectorcheckr.error", TRUE)) {
  if (!is.character(x_name)) x_name <- deparse(x_name)
  
  check_string_internal(x_name)
  check_flag_internal(error)
  
  check_atomic_internal(x)
  check_atomic_internal(values)
  
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
