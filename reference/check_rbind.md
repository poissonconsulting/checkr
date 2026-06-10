# Check Row Bind

Checks whether a data frame has the same columns of the same classes as
a second data frame which means they can be
[`rbind()`](https://rdrr.io/r/base/cbind.html)ed without a problem.

## Usage

``` r
check_rbind(
  x,
  y,
  exclusive = TRUE,
  order = FALSE,
  x_name = substitute(x),
  y_name = substitute(y),
  error = TRUE
)
```

## Arguments

- x:

  The first data frame.

- y:

  The second data frame.

- exclusive:

  A flag indicating whether other columns are not permitted.

- order:

  A flag indicating whether the columns have to occur in the same order.

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

[`check_join()`](https://poissonconsulting.github.io/checkr/reference/check_join.md)

## Examples

``` r
check_rbind(datasets::mtcars, datasets::mtcars)
#> Warning: `check_rbind()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_data()` instead.
```
