# Check Missing Names

Checks whether specific names are missing from an object.

## Usage

``` r
check_missing_names(x, names, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The named object to check.

- names:

  A character vector of the names that must be missing from x.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_names()`](https://poissonconsulting.github.io/checkr/reference/check_names.md)

## Examples

``` r
vec <- c(x = 1, y = 2, z = 0)
check_missing_names(vec, c("y", "x", "a"), error = FALSE)
#> Warning: `check_missing_names()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_not_subset(names()) instead.
#> Warning: vec must not have names 'y' and 'x'
check_missing_names(vec, "a", error = FALSE)
```
