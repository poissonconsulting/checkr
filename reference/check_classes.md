# Check Classes

Checks that an object inherits from one or more classes.

## Usage

``` r
check_classes(
  x,
  classes = character(0),
  exclusive = FALSE,
  order = FALSE,
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The object to check.

- classes:

  A character vector of the classes x should inherit from.

- exclusive:

  A flag indicating whether other classes are not permitted.

- order:

  A flag indicating whether the object classes have to occur in the same
  order as classes.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## Details

The classes of an object can be returned using the
[`class()`](https://rdrr.io/r/base/class.html) function.

## See also

[`check_inherits()`](https://poissonconsulting.github.io/checkr/reference/check_inherits.md)

## Examples

``` r
check_classes(list())
#> Warning: `check_classes()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_is(), chk::chk_s3_class(), chk::chk_s4_class(), or
#>   chk::check_values() instead.
check_classes(list(), "list")
check_classes(list(), "numeric", error = FALSE)
#> Warning: list() must inherit from class numeric
```
