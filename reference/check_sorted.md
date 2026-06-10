# Check Sorted

Checks whether object x is sorted using `!is.unsorted(x, na.rm = TRUE)`.

## Usage

``` r
check_sorted(x, x_name = substitute(x), error = TRUE)
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

[`check_vector()`](https://poissonconsulting.github.io/checkr/reference/check_vector.md)
and
[`check_list()`](https://poissonconsulting.github.io/checkr/reference/check_list.md)

## Examples

``` r
check_sorted(1:2, error = FALSE)
#> Warning: `check_sorted()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_sorted()` instead.
check_sorted(2:1, error = FALSE)
#> Warning: 2:1 must be sorted
```
