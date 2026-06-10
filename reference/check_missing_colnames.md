# Check Missing Colnames

Checks whether specific colnames are missing from a data frame.

## Usage

``` r
check_missing_colnames(x, colnames, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The data to check.

- colnames:

  A character vector of the column names that must be missing from x.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_colnames()`](https://poissonconsulting.github.io/checkr/reference/check_colnames.md)
and
[`check_data()`](https://poissonconsulting.github.io/checkr/reference/check_data.md)

## Examples

``` r
data <- data.frame(x = 1, y = 2, z = 0)
check_missing_colnames(data, c("y", "x", "a"), error = FALSE)
#> Warning: `check_missing_colnames()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_not_subset(names()) instead.
#> Warning: data must not have columns 'x' and 'y'
check_missing_colnames(data, "a", error = FALSE)
```
