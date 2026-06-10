# Check Unused

Checks whether ... is unused. It can only be used in functions.

## Usage

``` r
check_unused(..., x_name = "...", error = TRUE)
```

## Arguments

- ...:

  The arguments to check.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## Examples

``` r
fun <- function(...) check_unused(..., error = FALSE)
fun()
#> Warning: `check_unused()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_unused()` instead.
fun(1)
#> Warning: ... must be unused
```
