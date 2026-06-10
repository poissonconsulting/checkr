# Check List

Checks whether an object is a list and optionally the names and values
of its elements.

## Usage

``` r
check_list(
  x,
  values = NULL,
  length = NA,
  unique = FALSE,
  named = NA,
  exclusive = FALSE,
  order = FALSE,
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

- length:

  A flag indicating whether x should have elements (versus no elements)
  or a missing value indicating no requirements or a count or count
  range of the number of elements or a count vector of the permitted
  number of elements.

- unique:

  A flag indicating whether the values must be unique.

- named:

  A flag indicating whether the list must be named or unnamed or a
  regular expression that must match all the names or count or count
  range of the number of characters in the names or NA if it doesn't
  matter if the list is named.

- exclusive:

  A flag indicating whether other elements are not permitted.

- order:

  A flag indicating whether the elements have to occur in the same order
  as values.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_length()`](https://poissonconsulting.github.io/checkr/reference/check_length.md)
and
[`check_unique()`](https://poissonconsulting.github.io/checkr/reference/check_unique.md)

## Examples

``` r
check_list(list())
#> Warning: `check_list()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_list(), chk::check_dim(), chk::chk_unique(),
#>   chk::chk_named(), and/or chk::check_values() instead.
check_list(list(x1 = 2, x2 = 1:2), values = list(x1 = 1, x2 = 1L))
```
