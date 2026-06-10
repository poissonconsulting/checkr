# Check Logical

Checks if x is a logical vector with no attributes including names.

## Usage

``` r
check_logical(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- coerce:

  A flag indicating whether to drop attributes including names.

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
check_logical(1, error = FALSE)
#> Warning: `check_logical()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_logical()` instead.
#> Warning: 1 must be class logical
#> Warning: 1 must inherit from classes 'logical' in that order
check_logical(FALSE, error = FALSE)
check_logical(c(FALSE, TRUE), error = FALSE)
```
