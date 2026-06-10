# Check Count

Checks if an object is a count (non-negative integer or if
`coerce = TRUE` non-negative numeric whole number).

## Usage

``` r
check_count(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- coerce:

  A flag indicating whether to coerce a non-negative numeric (dbl) whole
  number to a count and drop attributes (including names).

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
check_count(-1L, error = FALSE)
#> Warning: `check_count()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_whole_number() and chk::chk_gte() instead.
#> Warning: the values in -1L must lie between 0 and 2147483647
check_count(1L, error = FALSE)
check_count(1, error = FALSE)
#> Warning: 1 must be class integer
#> Warning: 1 must inherit from classes 'integer' in that order
check_count(1, coerce = TRUE, error = FALSE)
check_count(1.01, coerce = TRUE, error = FALSE)
#> Warning: 1.01 must be class integer
#> Warning: 1.01 must inherit from classes 'integer' in that order
```
