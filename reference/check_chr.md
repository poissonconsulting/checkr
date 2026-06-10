# Check String

Checks if object is a string (non-missing character scalar with no
attributes including names).

## Usage

``` r
check_chr(x, coerce = FALSE, x_name = substitute(x), error = TRUE)

check_string(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- coerce:

  A flag indicating whether to coerce a factor scalar to a string and
  drop attributes including names.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_scalar()`](https://poissonconsulting.github.io/checkr/reference/check_scalar.md)

## Examples

``` r
check_chr(1, error = FALSE)
#> Warning: `check_chr()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_chr()` instead.
#> Warning: 1 must be class character
#> Warning: 1 must inherit from classes 'character' in that order
check_chr("1", error = FALSE)
check_chr(c("1", "2"), error = FALSE)
#> Warning: c("1", "2") must have 1 element
```
