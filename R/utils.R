is_flag <- function(x)  is.logical(x) && length(x) == 1 && !is.na(x)

is_NA <- function(x)  length(x) == 1 && is.na(x)

is.POSIXt <- function(x) inherits(x, "POSIXt")

is_Date <- function(x) inherits(x, "Date")

is_string <- function(x)  (is.character(x) || is.factor(x)) && length(x) == 1 && !is.na(x)

is_count <- function(x)  is.numeric(x) && length(x) == 1 &&
  !is.na(x) && x >= 0 && identical(as.numeric(x), floor(x))

is_count_range <- function(x) is.numeric(x) && length(x) %in% 1:2 && 
  all(!is.na(x) & x >= 0 & identical(as.numeric(x), floor(x)))

is_count_vector <- function(x) is.numeric(x) && length(x) >= 3 && 
  all(!is.na(x) & x >= 0 & identical(as.numeric(x), floor(x)))

is_length <- function(x) is_flag(x) || is_NA(x) || is_count_range(x) || is_count_vector(x)

check_string_internal <- function(x)
  if (!is_string(x)) err(substitute(x), " must be a string")

check_flag_internal <- function(x)
  if (!is_flag(x)) err(substitute(x), " must be a flag")

check_count_internal <- function(x)
  if (!is_count(x)) err(substitute(x), " must be a count")

check_length_internal <- function(x)
  if(!is_length(x))
    err(substitute(x), " must be a flag, a missing value, a count, a count range or a count vector")

#' Deparse
#' 
#' \code{chk_deparse} is a wrapper on \code{\link{deparse}} that
#' sets a missing value to be "NA"
#'
#' @param x A substituted object to deparse
#'
#' @return A string
#' @seealso \code{\link{deparse}}
#' @export
#'
#' @examples
#' chk_deparse(1^2)
chk_deparse <- function(x) {
  if (!is.character(x)) x <- deparse(x) 
  if (isTRUE(is.na(x))) x <- "NA"
  x
}

deparse_x_name <- function(x_name) {
  x_name <- chk_deparse(x_name)
  check_string_internal(x_name)
  x_name
}

deparse_y_name <- function(y_name) {
  y_name <- chk_deparse(y_name)
  check_string_internal(y_name)
  
  y_name
}

#' Max Int
#'
#' @return An int of the maximum integer value for the system.
#' @export
#'
#' @examples
#' chk_max_int()
chk_max_int <- function() .Machine$integer.max

#' Min Integer
#'
#' @return An int of the minimum integer value for the system.
#' @export
#'
#' @examples
#' chk_min_integer()
chk_min_int <- function() chk_max_int() * -1L

#' Max Double
#'
#' @return An dbl of the maximum numeric value for the system.
#' @export
#'
#' @examples
#' chk_max_dbl()
chk_max_dbl <- function() .Machine$double.xmax

#' Min Double
#'
#' @return An dbl of the minimum numeric value for the system.
#' @export
#'
#' @examples
#' chk_min_dbl()
chk_min_dbl <- function() .Machine$double.xmin

#' Fail
#'
#' @param ... The message.
#' @param error A flag indicating whether to return an error (the default) or a warning.
#'
#' @export
chk_fail <- function(..., error) {
  if (missing(error) || isTRUE(error)) err(...)
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
