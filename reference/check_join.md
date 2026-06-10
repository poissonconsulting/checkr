# Check Join

Checks that the columns in data frame x form a many-to-one join with the
corresponding columns in y, ie, the join is a unique key in y and all
the rows in x have a match in y.

## Usage

``` r
check_join(
  x,
  y,
  by = NULL,
  all_y = FALSE,
  x_name = substitute(x),
  y_name = substitute(y),
  error = TRUE
)
```

## Arguments

- x:

  The object to check.

- y:

  The parent data frame.

- by:

  A character vector or named character vector of the columns to join
  by.

- all_y:

  A flag indicating whether all the rows in y should have a match in x.

- x_name:

  A string of the name of the object x.

- y_name:

  A string of the name of the object y.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_data()`](https://poissonconsulting.github.io/checkr/reference/check_data.md)

## Examples

``` r
data1 <- data.frame(x = 1:2)
data2 <- data.frame(x = 3:5, y = 2L)
check_join(data1, data2, error = FALSE)
#> Warning: `check_join()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_join()` instead.
#> Warning: join between data1 and data2 must include all the rows in data1
check_join(data1, data2, by = c(x = "y"), error = FALSE)
#> Warning: column 'y' in data2 must be a unique key
#> Warning: join between data1 and data2 must include all the rows in data1
```
