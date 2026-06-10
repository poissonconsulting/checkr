# Check Length One

Checks whether x is an object of length 1.

## Usage

``` r
check_length1(x, x_name = substitute(x), error = TRUE)
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
check_length1(2)
#> Warning: `check_length1()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_dim()` instead.
check_length1(1:2, error = FALSE)
#> Warning: 1:2 must have 1 element
check_length1(NULL, error = FALSE)
#> Warning: NULL must have 1 element
check_length1(list(), error = FALSE)
#> Warning: list() must have 1 element
```
