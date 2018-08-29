is_flag <- function(x)  is.logical(x) && length(x) == 1 && !is.na(x)

is_NA <- function(x)  length(x) == 1 && is.na(x)

is.POSIXt <- function(x) inherits(x, "POSIXt")

is_Date <- function(x) inherits(x, "Date")
  
is_string <- function(x)  (is.character(x) || is.factor(x)) && length(x) == 1 && !is.na(x)

is_count <- function(x)  is.numeric(x) && length(x) == 1 &&
  !is.na(x) && x >= 0 && identical(as.numeric(x), floor(x))

is_count_range <- function(x) is.numeric(x) && length(x) %in% 1:2 && 
  all(!is.na(x) & x >= 0 & identical(as.numeric(x), floor(x)))

is_length <- function(x) is_flag(x) || is_NA(x) || is_count_range(x)

check_string_internal <- function(x)
  if (!is_string(x)) err(substitute(x), " must be a string")

check_flag_internal <- function(x)
  if (!is_flag(x)) err(substitute(x), " must be a flag")

check_count_internal <- function(x)
  if (!is_count(x)) err(substitute(x), " must be a count")

check_length_internal <- function(x)
  if(!is_length(x))
    err(substitute(x), " must be a flag, a missing value, a count or a count range")

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

on_fail <- function(..., error) {
  if (error) err(...)
  wrn(...)
}

tz <- function(x) {
  tz <- attr(x, "tzone")
  if(identical(tz, "") || is.null(tz))
    tz <- "UTC"
  tz
}

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
