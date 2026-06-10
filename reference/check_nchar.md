# Check Number of Characters

Checks the number of characters in the elements of an object.

## Usage

``` r
check_nchar(x, nchar = TRUE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- nchar:

  A flag indicating whether x should have characters or a missing value
  indicating no requirements or a count or count range of the number of
  characters.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_pattern()`](https://poissonconsulting.github.io/checkr/reference/check_pattern.md)
and
[`check_regex()`](https://poissonconsulting.github.io/checkr/reference/check_grepl.md)

## Examples

``` r
check_nchar(c("foo", "bar"), nchar = 3)
#> Warning: `check_nchar()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_equal(), chk::chk_range(), chk::chk_subset() etc with
#>   nchar() instead.
```
