# Check Integer

Checks if x is an integer vector with no attributes including names.

## Usage

``` r
check_integer(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- coerce:

  A flag indicating whether to coerce a numeric (dbl) whole number
  vector to an integer vector and drop attributes including names.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_int()`](https://poissonconsulting.github.io/checkr/reference/check_int.md)

## Examples

``` r
check_integer(1, error = FALSE)
#> Warning: `check_integer()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_integer()` instead.
#> Warning: 1 must be class integer
#> Warning: 1 must inherit from classes 'integer' in that order
check_integer(1L, error = FALSE)
check_integer(1:2, error = FALSE)
```
