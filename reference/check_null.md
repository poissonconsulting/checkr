# Check NULL

Checks whether an object is NULL.

## Usage

``` r
check_null(x, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## Examples

``` r
check_null(1, error = FALSE)
#> Warning: `check_null()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_null()` instead.
#> Warning: 1 must be NULL
check_null(NULL, error = FALSE)
```
