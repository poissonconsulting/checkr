# Check Number of Rows

Checks the number of rows of a data frame.

## Usage

``` r
check_nrow(x, nrow = TRUE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- nrow:

  A flag indicating whether x should have rows (versus no rows) or a
  missing value indicating no requirements or a count or count range of
  the number of rows.

  @return An invisible copy of x (if it doesn't throw an error).

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## See also

[`check_ncol()`](https://poissonconsulting.github.io/checkr/reference/check_ncol.md)
and
[`check_data()`](https://poissonconsulting.github.io/checkr/reference/check_data.md)

## Examples

``` r
check_nrow(data.frame(x = 1), error = FALSE)
#> Warning: `check_nrow()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_data()` instead.
check_nrow(data.frame(x = integer(0)), error = FALSE)
#> Warning: data.frame(x = integer(0)) must have at least 1 row
check_nrow(data.frame(x = 1:2), nrow = 1, error = FALSE)
#> Warning: data.frame(x = 1:2) must have 1 row
```
