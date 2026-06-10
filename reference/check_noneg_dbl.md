# Check Non-Negative Dbl

Checks if x is a non-negative dbl (non-missing numeric scalar with no
attributes including names).

## Usage

``` r
check_noneg_dbl(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- coerce:

  A flag indicating whether to coerce a scalar integer to a dbl and drop
  attributes including names.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_dbl()`](https://poissonconsulting.github.io/checkr/reference/check_dbl.md)

## Examples

``` r
check_noneg_dbl(1, error = FALSE)
#> Warning: `check_noneg_dbl()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_dbl() and chk::chk_gte() instead.
check_noneg_dbl(0L, error = FALSE)
#> Warning: 0L must be class numeric
#> Warning: 0L must inherit from classes 'numeric' in that order
check_noneg_dbl(0, error = FALSE)
```
