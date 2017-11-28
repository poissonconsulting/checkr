check_n <- function(x, n, range, x_name, n_name, error) {
  if (identical(length(range), 1L)) {
    if (n != range) {
      on_fail(x_name, " must have ", range, " ", plural(n_name, range), error = error)
    }
    return(x)
  }

  if (n < min(range)) {
    on_fail(x_name, " must have at least ", min(range), " ", plural(n_name, min(range)), error = error)
  }
  if (n > max(range)) {
    on_fail(x_name, " must not have more than ", max(range), " ", plural(n_name, max(range)), error = error)
  }
  x
}
