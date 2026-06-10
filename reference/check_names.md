# Check Names

Checks the names of an object as returned by the
[`names()`](https://rdrr.io/r/base/names.html) function. The function
can check the order of the names and whether other names are permitted.

## Usage

``` r
check_names(
  x,
  names = character(0),
  exclusive = FALSE,
  order = FALSE,
  unique = FALSE,
  complete = TRUE,
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The object to check.

- names:

  A character vector of the names.

- exclusive:

  A flag indicating whether other names are not permitted.

- order:

  A flag indicating whether the object names have to occur in the same
  order as names.

- unique:

  A flag indicating whether all the object names have to be unique.

- complete:

  A flag indicating whether all the possible names have to be
  represented.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_named()`](https://poissonconsulting.github.io/checkr/reference/check_named.md)

## Examples

``` r
vec <- c(x = 1, y = 2, z = 0)
check_names(vec, c("y", "x"), error = FALSE)
#> Warning: `check_names()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_names()` instead.
check_names(vec, c("y", "x"), exclusive = TRUE, error = FALSE)
#> Warning: vec names must not include 'z'
check_names(vec, c("y", "x"), order = TRUE, error = FALSE)
#> Warning: vec names must include 'y' and 'x' in that order
check_names(vec, c("a"), error = FALSE)
#> Warning: vec names must include 'a'
```
