# Check Character

Checks if x is a character vector with no attributes including names.

## Usage

``` r
check_character(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- coerce:

  A flag indicating whether to coerce a factor to a character vector and
  drop attributes including names.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_int()`](https://poissonconsulting.github.io/checkr/reference/check_int.md)

## Examples

``` r
check_character("1", error = FALSE)
#> Warning: `check_character()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_character()` instead.
check_character(1:2, error = FALSE)
#> Warning: 1:2 must be class character
#> Warning: 1:2 must inherit from classes 'character' in that order
```
