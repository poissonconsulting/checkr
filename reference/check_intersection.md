# Check Atomic Vector Intersection

Checks that all the elements in atomic vector x intersect with those in
atomic vector y.

## Usage

``` r
check_intersection(
  x,
  y,
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

  The second atomic vector.

- all_y:

  A flag indicating whether all the elements in y should have a match in
  x.

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
x1 <- 1:3
x2 <- 1:4
check_intersection(x1, x2)
#> Warning: `check_intersection()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_join()` instead.
check_intersection(x2, x1, error = FALSE)
#> Warning: x1 must include all the elements in x2
```
