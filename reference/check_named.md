# Check Named

Checks whether an object is named.

## Usage

``` r
check_named(
  x,
  nchar = c(0L, chk_max_int()),
  pattern = ".*",
  regex = pattern,
  unique = FALSE,
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The object to check.

- nchar:

  A count or count range of the number of characters.

- pattern:

  A string of the regular expression that must match all names.

- regex:

  A string of the regular expression that must match all names.

- unique:

  A flag indicating whether the names must be unique.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_unnamed()`](https://poissonconsulting.github.io/checkr/reference/check_unnamed.md),
[`check_names()`](https://poissonconsulting.github.io/checkr/reference/check_names.md)
and
[`check_missing_names()`](https://poissonconsulting.github.io/checkr/reference/check_missing_names.md)

## Examples

``` r
check_named(2, error = FALSE)
#> Warning: 2 must be named
x <- 1
names(x) <- "y"
check_named(x, error = FALSE)
```
