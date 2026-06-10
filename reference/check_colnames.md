# Check Colnames

Checks the column names of a data frame as returned by the
[`colnames()`](https://rdrr.io/r/base/colnames.html) function. The
function can check the order of the columns and whether other columns
are permitted.

## Usage

``` r
check_colnames(
  x,
  colnames = character(0),
  exclusive = FALSE,
  order = FALSE,
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The data to check.

- colnames:

  A character vector of the column names.

- exclusive:

  A flag indicating whether other columns are not permitted.

- order:

  A flag indicating whether the columns have to occur in the same order
  as colnames.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_missing_colnames()`](https://poissonconsulting.github.io/checkr/reference/check_missing_colnames.md)
and
[`check_data()`](https://poissonconsulting.github.io/checkr/reference/check_data.md)

## Examples

``` r
data <- data.frame(x = 1, y = 2, z = 0)
check_colnames(data, c("y", "x"), error = FALSE)
#> Warning: `check_colnames()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_data()` instead.
check_colnames(data, c("y", "x"), exclusive = TRUE, error = FALSE)
#> Warning: data column names must include and only include 'y' and 'x'
check_colnames(data, c("y", "x"), order = TRUE, error = FALSE)
#> Warning: data column names must include 'y' and 'x' in that order
check_colnames(data, c("a"), error = FALSE)
#> Warning: data column names must include 'a'
```
