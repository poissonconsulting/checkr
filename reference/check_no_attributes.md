# Check No Attributes

Checks an object has no attributes.

## Usage

``` r
check_no_attributes(
  x,
  names = TRUE,
  class = TRUE,
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The object to check.

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

[`check_attributes()`](https://poissonconsulting.github.io/checkr/reference/check_attributes.md)

## Examples

``` r
x <- 1
attributes(x) <- list(y = 2L)
check_no_attributes(x, error = FALSE)
#> Warning: `check_no_attributes()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_null(attributes()) instead
#> Warning: x must not have attributes
```
