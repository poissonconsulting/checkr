# Check Matches Regular Expression

Checks whether all the elements of an object match a regular expression.

## Usage

``` r
check_grepl(
  x,
  pattern = ".*",
  regex = pattern,
  x_name = substitute(x),
  error = TRUE
)

check_regex(x, regex = ".*", x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- pattern:

  A string of the regular expression.

- regex:

  A string of the regular expression (deprecated for pattern).

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_nchar()`](https://poissonconsulting.github.io/checkr/reference/check_nchar.md)
and
[`check_pattern()`](https://poissonconsulting.github.io/checkr/reference/check_pattern.md)

## Examples

``` r
check_grepl("foo", "fo")
check_grepl("foo", "fo$", error = FALSE)
#> Warning: foo must match regular expression 'fo$'
```
