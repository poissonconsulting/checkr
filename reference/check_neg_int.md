# Check Negative Int

Checks if x is a negative int (non-missing integer scalar with no
attributes including names).

## Usage

``` r
check_neg_int(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
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
check_neg_int(0L, error = FALSE)
#> Warning: `check_neg_int()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_integer() and chk::chk_lt() instead.
#> Warning: the values in 0L must lie between -2147483647 and -1
check_neg_int(-1L, error = FALSE)
```
