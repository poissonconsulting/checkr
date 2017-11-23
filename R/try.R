try_check <- function(expr) {
  try(eval(expr, envir = parent.frame(3)), silent = TRUE)
}

try_message <- function(x) {
  x <- as.character(x)
  x <- sub("^Error.*[:] ", "", x, perl = TRUE)
  x <- sub("\n$", "", x, perl = TRUE)
  x
}

is.try_error <- function(x) inherits(x, "try-error")
