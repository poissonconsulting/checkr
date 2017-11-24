is_flag <- function(x)  is.logical(x) && length(x) == 1 && !is.na(x)

is_string <- function(x)  (is.character(x) || is.factor(x)) && length(x) == 1 && !is.na(x)

is_count <- function(x)  (is.integer(x) || is.numeric(x)) && length(x) == 1 &&
  !is.na(x) && x >= 0 && identical(as.numeric(x), floor(x))

check_string_internal <- function(x)
  if (!is_string(x)) error(substitute(x), " must be a string")

check_flag_internal <- function(x)
  if (!is_flag(x)) error(substitute(x), " must be a flag")

check_count_internal <- function(x)
  if (!is_count(x)) error(substitute(x), " must be a count")

error <- function(...) stop(..., call. = FALSE)

warning <- function(...) {
  base::warning(..., call. = FALSE, immediate. = TRUE, noBreaks. = TRUE)
}

on_fail <- function(..., error) {
  if (error) error(...)
  warning(...)
}

punctuate <- function(x, qualifier = "or") {
  if (is.logical(x) || is.integer(x) || is.numeric(x)) {
    x <- as.character(x)
  } else
    x <- paste0("'", as.character(x), "'")
  if (length(x) == 1)
    return(x)
  n <- length(x)
  paste(paste(x[-n], collapse = ", "), qualifier, x[n])
}

plural <- function(x, n = 1, end = "") paste0(x, ifelse(n != 1, "s", ""), end)
