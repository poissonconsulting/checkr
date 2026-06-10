# Check Key

Checks that columns in a data frame represent a unique key. By default
all the columns are checked.

## Usage

``` r
check_key(
  x,
  key = names(x),
  na_distinct = FALSE,
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The data to check.

- key:

  A character vector of the column names representing the key.

- na_distinct:

  A flag specifying whether missing values should be considered
  distinct.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_data()`](https://poissonconsulting.github.io/checkr/reference/check_data.md)

## Examples

``` r
data <- data.frame(x = 1:1, y = 1:2)
check_key(data, "x", error = FALSE)
#> Warning: `check_key()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_key()` instead.
#> Warning: column 'x' in data must be a unique key
check_key(data, c("y", "x"), error = FALSE)
```
