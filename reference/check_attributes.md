# Check Attributes

Checks an objects attributes.

## Usage

``` r
check_attributes(
  x,
  values = NULL,
  exclusive = FALSE,
  order = FALSE,
  names = TRUE,
  class = TRUE,
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The object to check.

- values:

  NULL (default) or a character vector specifying the column names or a
  named list specifying the column names and values.

- exclusive:

  A flag indicating whether other elements are not permitted.

- order:

  A flag indicating whether the elements have to occur in the same order
  as values.

- names:

  A flag specifying whether names should be considered an attribute.

- class:

  A flag specifying whether class should be considered an attribute.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_list()`](https://poissonconsulting.github.io/checkr/reference/check_list.md)

## Examples

``` r
x <- 1
attributes(x) <- list(y = 2L)
check_attributes(x, values = list(y = 3:4), error = FALSE)
#> Warning: `check_attributes()` was deprecated in checkr 0.5.1.
#> ℹ Pull out attributes with `attributes()` and then use appropriate chk function
#> Warning: the values in element y of attributes of x must lie between 3 and 4
```
