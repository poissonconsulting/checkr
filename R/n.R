check_n <- function(x, n, range, x_name, n_name, error) {
  if(is_NA(range)) return(x)
  
  if(is.null(n)) n <- 0L
  
  if(is_flag(range) && range) {
    range <- c(1L, .Machine$integer.max)
  } else if(is_flag(range) && !range)
    range <- 0L

  if (identical(length(range), 1L)) {
    if (any(n != range)) {
      on_fail(x_name, " must have ", range, " ", plural(n_name, range), error = error)
    }
    return(x)
  }

  if (any(n < min(range))) {
    on_fail(x_name, " must have at least ", min(range), " ", plural(n_name, min(range)), error = error)
  }
  if (any(n > max(range))) {
    on_fail(x_name, " must not have more than ", max(range), " ", plural(n_name, max(range)), error = error)
  }
  x
}
