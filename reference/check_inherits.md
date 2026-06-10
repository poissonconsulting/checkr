# Check Inherits

Checks if an object inherits from a class.

## Usage

``` r
check_inherits(x, class, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- class:

  A string of the class x should inherit from.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_classes()`](https://poissonconsulting.github.io/checkr/reference/check_classes.md)

## Examples

``` r
check_inherits(list(), "list")
#> Warning: `check_inherits()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_is()` instead.
check_inherits(list(), "numeric", error = FALSE)
#> Warning: list() must inherit from class numeric
```
