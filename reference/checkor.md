# Check OR

Checks that at least one check passes.

## Usage

``` r
checkor(..., error = TRUE)
```

## Arguments

- ...:

  The checks to check.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible flag indicating whether at least one check passes (if it
doesn't throw an error).

## Examples

``` r
checkor(check_null(NULL), check_null(1), error = FALSE)
#> Warning: `checkor()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chkor()` instead.
checkor(check_null(1), check_null(1), error = FALSE)
#> Warning: 1 must be NULL
checkor(check_null(1), check_null(2), error = FALSE)
#> Warning: 1 must be NULL OR 2 must be NULL
```
