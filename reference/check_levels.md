# Check Levels

Checks the levels in a factor including the order and whether other
levels are permitted.

## Usage

``` r
check_levels(
  x,
  levels,
  exclusive = TRUE,
  order = TRUE,
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The object to check.

- levels:

  A character vector of the levels.

- exclusive:

  A flag indicating whether other levels are not permitted.

- order:

  A flag indicating whether the object levels have to occur in the same
  order as names. To check whether x is an ordered factor use
  `check_vector(x, ordered(1))`.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_nlevels()`](https://poissonconsulting.github.io/checkr/reference/check_nlevels.md)
and
[`check_vector()`](https://poissonconsulting.github.io/checkr/reference/check_vector.md)

## Examples

``` r
check_levels(1, c("x", "y"), error = FALSE)
#> Warning: `check_levels()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_data()` instead.
#> Warning: 1 must have a levels attribute
#> Warning: 1 levels must be identical to 'x' and 'y'
check_levels(factor(1), c("x", "y"), error = FALSE)
#> Warning: factor(1) levels must be identical to 'x' and 'y'
```
