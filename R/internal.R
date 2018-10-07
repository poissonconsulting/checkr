check_n <- function(x, n, range, x_name, n_name, error) {
  if(is_NA(range)) return(x)
  
  if(is.null(n)) n <- 0L
  
  if(is_flag(range) && range) {
    range <- c(1L, .Machine$integer.max)
  } else if(is_flag(range) && !range)
    range <- 0L
  
  if (identical(length(range), 1L)) {
    if (any(n != range)) {
      on_fail(x_name, " must have ", range, " ", n_name, cn(range, "%s"), error = error)
    }
    return(x)
  }
  if(identical(length(range), 2L)) {
    if (any(n < min(range))) {
      on_fail(x_name, " must have at least ", min(range), " ", n_name, cn(min(range), "%s"), error = error)
    }
    if (any(n > max(range))) {
      on_fail(x_name, " must not have more than ", max(range), " ", n_name, cn(max(range), "%s"), error = error)
    }
    return(x)
  }
  range <- sort(unique(range))
  if(!n %in% range) {
    on_fail(x_name, " must have ", cc(range, "or"), " ", n_name, "s", error = error)
  }
  return(x)
}

check_nas <- function(x,
                      values,
                      x_name = substitute(x),
                      error = TRUE) {
  
  x_name <- deparse_x_name(x_name)
  
  check_flag_internal(error)
  
  if(!length(values)) return(invisible(x))
  
  nas <- is.na(values)
  
  if(!length(nas)) return(invisible(x))
  
  if(!any(nas) && any(is.na(x))) {
    on_fail(x_name, " must not include missing values", error = error)
  } else if (all(nas) && !all(is.na(x))) {
    on_fail(x_name, " must only include missing values", error = error)
  }
  invisible(x)
}

check_class_internal <- function(x,
                                 values,
                                 x_name = substitute(x),
                                 error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_flag_internal(error)
  
  class <- class(values)[1]
  
  if (!inherits(x, class)) {
    on_fail(x_name, " must be class ", class, error = error)
  }
  invisible(x)
}

check_values <- function(x, values,
                         only = FALSE,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- deparse_x_name(x_name)
  
  check_flag_internal(error)
  
  if (!is.atomic(x)) err(x_name, " must be an atomic vector")
  if (!is.atomic(values)) err("values must be an atomic vector")
  
  check_class_internal(x, values, x_name = x_name, error = error)
  check_nas(x, values, x_name = x_name, error = error)
  
  x_nona <- x[!is.na(x)]
  if(!length(x_nona)) return(invisible(x))
  
  values <- values[!is.na(values)]
  if(!only && length(values) < 2) return(invisible(x))
  
  x_nona <- sort(x_nona)
  values <- sort(values)
  
  if(!only && identical(length(values), 2L)) {
    if(x_nona[1] < values[1] || x_nona[length(x_nona)] > values[2]) {
      on_fail("the values in ", x_name,
              " must lie between ", cc(values[1:2], "and"), error = error)
    }
  } else if (!all(x_nona %in% values)) {
    unpermitted <- x_nona[!x_nona %in% values]
    unpermitted <- unique(unpermitted)
    values <- unique(values)
    if(length(values) < 10) {
      on_fail(x_name, " can only include values ", cc(values, "or"), error = error)
    } else if(length(unpermitted) < 10) {
      on_fail(x_name, " has unpermitted values ", cc(unpermitted, "and"), error = error)
    } else
      on_fail(x_name, " has unpermitted values ", error = error)
  }
  invisible(x)
}
