# Check Name

Checks whether each element of a character vector is a syntactically
valid name.

## Usage

``` r
check_name(x, x_name = substitute(x), coerce = FALSE, error = TRUE)
```

## Arguments

- x:

  The object to check.

- x_name:

  A string of the name of the object x.

- coerce:

  A flag specifying whether to coerce a factor to a character vector and
  drop attributes including names.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_character()`](https://poissonconsulting.github.io/checkr/reference/check_character.md)

## Examples

``` r
vec <- c("x", "x.y", "x y")
check_name(vec, error = FALSE)
#> Warning: `check_name()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_names()` instead.
#> Warning: the following 1 value of vec is invalid: 'x y'
```
