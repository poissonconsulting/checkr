# Check Scalar

Checks whether an object is an atomic vector with one element.

## Usage

``` r
check_scalar(
  x,
  values = NULL,
  named = FALSE,
  attributes = named,
  only = FALSE,
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The object to check.

- values:

  NULL or a vector specifying the values.

- named:

  A flag indicating whether the scalar must be named or unnamed or NA if
  it doesn't matter if the scalar is named.

- attributes:

  A flag indicating whether the scalar must or must not have attributes
  or NA if it doesn't matter if the scalar is named.

- only:

  A flag indicating whether only the actual values are permitted. It
  only affects values with two or less non-missing elements.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_vector()`](https://poissonconsulting.github.io/checkr/reference/check_vector.md)

## Examples

``` r
check_scalar(1)
#> Warning: `check_scalar()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_scalar()` instead.
check_scalar(c(1,2), error = FALSE)
#> Warning: c(1, 2) must have 1 element
check_scalar(1, c(2,3), error = FALSE)
#> Warning: the values in 1 must lie between 2 and 3
```
