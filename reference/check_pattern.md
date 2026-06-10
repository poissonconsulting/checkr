# Check Pattern

Checks whether all or some of the elements of x match pattern using
[`grepl()`](https://rdrr.io/r/base/grep.html).

## Usage

``` r
check_pattern(x, pattern, all = TRUE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- pattern:

  A string of the regular expression.

- all:

  A flag indicating whether all or some of the element must match
  pattern.

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
[`check_regex()`](https://poissonconsulting.github.io/checkr/reference/check_grepl.md)
