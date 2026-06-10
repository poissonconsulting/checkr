# Check Number of Columns

Checks the number of columns of a data frame.

## Usage

``` r
check_ncol(x, ncol = TRUE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- ncol:

  A flag indicating whether x should have columns (versus no columns) or
  a missing value indicating no requirements or a count or count range
  of the number of columns.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_nrow()`](https://poissonconsulting.github.io/checkr/reference/check_nrow.md)
and
[`check_data()`](https://poissonconsulting.github.io/checkr/reference/check_data.md)

## Examples

``` r
check_ncol(data.frame(x = 1), error = FALSE)
#> Warning: `check_ncol()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_dim()` instead.
check_ncol(data.frame(x = 1:2), ncol = 1, error = FALSE)
```
