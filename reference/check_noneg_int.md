# Check Non-Negative Int

Checks if x is a count (non-missing non-negative integer scalar with no
attributes including names).

## Usage

``` r
check_noneg_int(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
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

[`check_int()`](https://poissonconsulting.github.io/checkr/reference/check_int.md)

## Examples

``` r
check_noneg_int(1, error = FALSE)
#> Warning: `check_noneg_int()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_integer() and chk::chk_gte() instead.
#> Warning: 1 must be class integer
#> Warning: 1 must inherit from classes 'integer' in that order
check_noneg_int(0L, error = FALSE)
check_noneg_int(1L, error = FALSE)
```
