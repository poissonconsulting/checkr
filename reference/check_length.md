# Check Length

Checks whether the number of elements in an object is an exact number,
within a range or 0 vs positive.

## Usage

``` r
check_length(x, length = TRUE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- length:

  A flag indicating whether x should have elements (versus no elements)
  or a missing value indicating no requirements or a count or count
  range of the number of elements or a count vector of the permitted
  number of elements.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_vector()`](https://poissonconsulting.github.io/checkr/reference/check_vector.md),
[`check_list()`](https://poissonconsulting.github.io/checkr/reference/check_list.md)
and
[`check_data()`](https://poissonconsulting.github.io/checkr/reference/check_data.md)

## Examples

``` r
check_length(2)
#> Warning: `check_length()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_dim()` instead.
check_length(character(0), length = 0)
check_length(NULL, error = FALSE)
#> Warning: NULL must have at least 1 element
check_length(list(), error = FALSE)
#> Warning: list() must have at least 1 element
```
