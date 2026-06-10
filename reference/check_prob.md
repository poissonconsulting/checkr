# Check Probability

Checks if x is a probability (non-missing dbl between 0 and 1 inclusive
with no attributes including names).

## Usage

``` r
check_prob(x, coerce = FALSE, x_name = substitute(x), error = TRUE)

check_probability(x, coerce = FALSE, x_name = substitute(x), error = TRUE)

check_prop(x, coerce = FALSE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- coerce:

  A flag indicating whether to coerce an integer to a dbl and drop
  attributes including names.

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
check_prob(1, error = FALSE)
#> Warning: `check_prob()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_dbl() and chk::chk_range() instead.
check_prob(1.1, error = FALSE)
#> Warning: the values in 1.1 must lie between 0 and 1
check_prob(c(0, 1), error = FALSE)
#> Warning: c(0, 1) must have 1 element
```
