# Check Date

Checks if x is a date (non-missing unnamed Date scalar).

## Usage

``` r
check_date(x, coerce = FALSE, x_name = substitute(x), error = TRUE)

check_day(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- coerce:

  A flag indicating whether to coerce a date time (POSIXt scalar) to a
  Date and remove names.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_datetime()`](https://poissonconsulting.github.io/checkr/reference/check_dttm.md)

## Examples

``` r
check_date(Sys.Date(), error = FALSE)
#> Warning: `check_date()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_date()` instead.
check_date(Sys.time(), error = FALSE)
#> Warning: Sys.time() must be class Date
#> Warning: Sys.time() must inherit from classes 'Date' in that order
check_date(Sys.time(), coerce = TRUE, error = FALSE)
```
