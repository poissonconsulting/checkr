# Check nlevels

Checks the number of levels of an object.

## Usage

``` r
check_nlevels(x, nlevels = TRUE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The data to check.

- nlevels:

  A flag indicating whether x should have elements (versus no elements)
  or a missing value indicating no requirements or a count or count
  range of the number of elements.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_levels()`](https://poissonconsulting.github.io/checkr/reference/check_levels.md)
and
[`check_vector()`](https://poissonconsulting.github.io/checkr/reference/check_vector.md)

## Examples

``` r
check_nlevels(factor(1), error = FALSE)
#> Warning: `check_nlevels()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_dim()` instead.
check_nlevels(factor(1), nlevels = 2, error = FALSE)
#> Warning: factor(1) must have 2 levels
```
