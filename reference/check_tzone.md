# Check TimeZone

Checks an objects tzone attribute.

## Usage

``` r
check_tzone(x, tzone = "UTC", x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- tzone:

  A string of the time zone.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## Examples

``` r
check_tzone(Sys.Date(), error = FALSE)
#> Warning: `check_tzone()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_tz()` instead.
#> Warning: Sys.Date() time zone must be 'UTC' (not 'NULL')
x <- as.POSIXct("2000-01-02 03:04:55", tz = "Etc/GMT+8")
check_tzone(x, tzone = "PST8PDT", error = FALSE)
#> Warning: x time zone must be 'PST8PDT' (not 'Etc/GMT+8')
```
