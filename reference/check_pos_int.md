# Check Positive Int

Checks if x is a positive int (non-missing integer scalar with no
attributes including names).

## Usage

``` r
check_pos_int(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- coerce:

  A flag indicating whether to coerce a numeric (dbl) whole number to an
  int and drop attributes including names.

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
check_pos_int(0, error = FALSE)
#> Warning: `check_pos_int()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_integer() and chk::chk_gt() instead.
#> Warning: 0 must be class integer
#> Warning: 0 must inherit from classes 'integer' in that order
#> Warning: the values in 0 must lie between 1 and 2147483647
check_pos_int(1L, error = FALSE)
check_pos_int(1:2, error = FALSE)
#> Warning: 1:2 must have 1 element
```
