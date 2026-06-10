# Check Numeric

Checks if x is an numeric (double) vector with no attributes including
names.

## Usage

``` r
check_numeric(x, coerce = FALSE, x_name = substitute(x), error = TRUE)

check_double(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- coerce:

  A flag indicating whether to coerce a integer vector to an double
  vector and drop attributes including names.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_number()`](https://poissonconsulting.github.io/checkr/reference/check_dbl.md)

## Examples

``` r
check_numeric(1, error = FALSE)
#> Warning: `check_numeric()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_numeric()` instead.
check_numeric(1L, error = FALSE)
#> Warning: 1L must be class numeric
#> Warning: 1L must inherit from classes 'numeric' in that order
check_numeric(1:2, error = FALSE)
#> Warning: 1:2 must be class numeric
#> Warning: 1:2 must inherit from classes 'numeric' in that order
```
