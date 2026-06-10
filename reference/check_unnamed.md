# Check Unnamed

Checks whether an objects is unnamed.

## Usage

``` r
check_unnamed(x, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_named()`](https://poissonconsulting.github.io/checkr/reference/check_named.md),
[`check_names()`](https://poissonconsulting.github.io/checkr/reference/check_names.md)
and
[`check_missing_names()`](https://poissonconsulting.github.io/checkr/reference/check_missing_names.md)

## Examples

``` r
check_unnamed(2, error = FALSE)
#> Warning: `check_unnamed()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_null_or()` instead.
x <- 1
names(x) <- "y"
check_unnamed(x, error = FALSE)
#> Warning: x must be unnamed
```
