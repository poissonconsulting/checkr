# Check Date Time

Checks if x is a datetime (non-missing unnamed POSIXct scalar).

## Usage

``` r
check_dttm(
  x,
  coerce = FALSE,
  tzone = "UTC",
  x_name = substitute(x),
  error = TRUE
)

check_datetime(
  x,
  coerce = FALSE,
  tzone = "",
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The object to check.

- coerce:

  A flag indicating whether to coerce a date to a dttm (using the time
  zone tzone) and remove names.

- tzone:

  A string of the time zone where "" is the current time zone.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_scalar()`](https://poissonconsulting.github.io/checkr/reference/check_scalar.md)

## Examples

``` r
check_dttm(Sys.Date(), error = FALSE)
#> Warning: `check_dttm()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_date_time() and chk::chk_tz() instead.
#> Warning: Sys.Date() must be class POSIXct
#> Warning: Sys.Date() must be class POSIXt
#> Warning: Sys.Date() must inherit from classes 'POSIXct' and 'POSIXt' in that order
#> Warning: x time zone must be 'UTC' (not 'NULL')
check_dttm(Sys.time(), error = FALSE)
#> Warning: x time zone must be 'UTC' (not 'NULL')
```
