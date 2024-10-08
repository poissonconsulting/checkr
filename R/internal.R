check_n <- function(x, n, range, x_name, n_name, error) {
  if(is_NA(range)) return(x)
  
  if(is.null(n)) n <- 0L
  
  if(is_flag(range) && range) {
    range <- c(1L, chk_max_int())
  } else if(is_flag(range) && !range)
    range <- 0L
  
  if (identical(length(range), 1L)) {
    if (any(n != range)) {
      chk_fail(x_name, " must have ", range, " ", n_name, cn(range, "%s"), error = error)
    }
    return(x)
  }
  if(identical(length(range), 2L)) {
    if (any(n < min(range))) {
      chk_fail(x_name, " must have at least ", min(range), " ", n_name, cn(min(range), "%s"), error = error)
    }
    if (any(n > max(range))) {
      chk_fail(x_name, " must not have more than ", max(range), " ", n_name, cn(max(range), "%s"), error = error)
    }
    return(x)
  }
  range <- sort(unique(range))
  if(!n %in% range) {
    chk_fail(x_name, " must have ", cc_or(range), " ", n_name, "s", error = error)
  }
  return(x)
}

check_nas <- function(x,
                      values,
                      x_name = substitute(x),
                      error = TRUE) {
  
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(error)
  
  if(!length(values)) return(invisible(x))
  
  nas <- is.na(values)
  
  if(!length(nas)) return(invisible(x))
  
  if(!any(nas) && any(is.na(x))) {
    chk_fail(x_name, " must not include missing values", error = error)
  } else if (all(nas) && !all(is.na(x))) {
    chk_fail(x_name, " must only include missing values", error = error)
  }
  invisible(x)
}

check_class_internal <- function(x,
                                 values,
                                 x_name = substitute(x),
                                 error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  check_flag_internal(error)
  
  for(class in class(values)) {
    if (!inherits(x, class)) {
      chk_fail(x_name, " must be class ", class, error = error)
    }
  }
  if(!identical(class(values), intersect(class(x), class(values)))) {
      chk_fail(x_name, " must inherit from classes ", cc_and(class(values)), 
               " in that order", error = error)
  }
  if("units" %in% class(values)) {
    rlang::check_installed("units", reason = "to check units")
    if(!identical(units::deparse_unit(x), units::deparse_unit(values)))
      err(x_name, " must have units '", units::deparse_unit(values), "' not '", units::deparse_unit(x), "'")
  }
  
  invisible(x)
}

check_values <- function(x, values,
                         only = FALSE,
                         x_name = substitute(x),
                         error = TRUE) {
  x_name <- chk_deparse(x_name)
  
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
      chk_fail("the values in ", x_name,
               " must lie between ", cc_and(values[1:2]), error = error)
    }
  } else if (!all(x_nona %in% values)) {
    unpermitted <- x_nona[!x_nona %in% values]
    unpermitted <- unique(unpermitted)
    values <- unique(values)
    if(length(values) < 10) {
      chk_fail(x_name, " can only include values ", cc_or(values), error = error)
    } else if(length(unpermitted) < 10) {
      chk_fail(x_name, " has unpermitted values ", cc_and(unpermitted), error = error)
    } else
      chk_fail(x_name, " has unpermitted values ", error = error)
  }
  invisible(x)
}
