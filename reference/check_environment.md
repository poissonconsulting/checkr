# Check Environment

Checks if x is an environment.

## Usage

``` r
check_environment(x, x_name = substitute(x), error = TRUE)
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

## Examples

``` r
check_environment(1, error = FALSE)
#> Warning: `check_environment()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_environment()` instead.
#> Warning: 1 must be an environment
check_environment(.GlobalEnv, error = FALSE)
```
