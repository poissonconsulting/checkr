is_flag <- function(x)  is.logical(x) && length(x) == 1 && !is.na(x)

is_NA <- function(x)  length(x) == 1 && is.na(x)

is.POSIXt <- function(x) inherits(x, "POSIXt")
  
is_string <- function(x)  (is.character(x) || is.factor(x)) && length(x) == 1 && !is.na(x)

is_count <- function(x)  (is.integer(x) || is.numeric(x)) && length(x) == 1 &&
  !is.na(x) && x >= 0 && identical(as.numeric(x), floor(x))

is_count_range <- function(x)
  length(x) %in% 1:2 && all(!is.na(x) & x >= 0 & identical(as.numeric(x), floor(x)))

is_length <- function(x) is_flag(x) || is_NA(x) || is_count_range(x)

check_string_internal <- function(x)
  if (!is_string(x)) error(substitute(x), " must be a string")

check_flag_internal <- function(x)
  if (!is_flag(x)) error(substitute(x), " must be a flag")

check_count_internal <- function(x)
  if (!is_count(x)) error(substitute(x), " must be a count")

check_length_internal <- function(x)
  if(!is_length(x))
    error(substitute(x), " must be a flag, a missing value, a count or a count range")

deparse_x_name <- function(x_name) {
  if (!is.character(x_name)) x_name <- deparse(x_name) 
  if (isTRUE(is.na(x_name))) x_name <- "NA"
  
  check_string_internal(x_name)

  x_name
}

deparse_y_name <- function(y_name) {
  if (!is.character(y_name)) y_name <- deparse(y_name) 
  if (isTRUE(is.na(y_name))) y_name <- "NA"
  
  check_string_internal(y_name)

  y_name
}

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

tz <- function(x) {
  tz <- attr(x, "tzone")
  if(identical(tz, "") || is.null(tz))
    tz <- "UTC"
  tz
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
