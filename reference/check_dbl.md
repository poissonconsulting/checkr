# Check Dbl

Checks if x is a dbl (non-missing numeric scalar with no attributes
including names).

## Usage

``` r
check_dbl(x, coerce = FALSE, x_name = substitute(x), error = TRUE)

check_number(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
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

[`check_scalar()`](https://poissonconsulting.github.io/checkr/reference/check_scalar.md)

## Examples

``` r
check_dbl(1, error = FALSE)
#> Warning: `check_dbl()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_dbl()` instead.
check_dbl(1L, error = FALSE)
#> Warning: 1L must be class numeric
#> Warning: 1L must inherit from classes 'numeric' in that order
check_dbl(c(1,2), error = FALSE)
#> Warning: c(1, 2) must have 1 element
```
