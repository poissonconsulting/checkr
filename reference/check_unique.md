# Check Unique

Checks whether all elements of an object are unique.

## Usage

``` r
check_unique(x, x_name = substitute(x), error = TRUE)
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

## See also

[`check_vector()`](https://poissonconsulting.github.io/checkr/reference/check_vector.md)

## Examples

``` r
check_unique(2, error = FALSE)
#> Warning: `check_unique()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_unique()` instead.
check_unique(c(2,2), error = FALSE)
#> Warning: c(2, 2) must be unique
check_unique(1:2, error = FALSE)
check_unique(character(0), error = FALSE)
check_unique(NULL, error = FALSE)
check_unique(list(), error = FALSE)
```
