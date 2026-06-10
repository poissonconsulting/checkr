# Check Function

Checks if x is a function.

## Usage

``` r
check_function(x, nargs = NA, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- nargs:

  A count of the number of arguments or count range of the minimum and
  maximum number of arguments.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## Examples

``` r
check_function(character, error = FALSE)
#> Warning: `check_function()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_function()` instead.
check_function(character, nargs = 0L, error = FALSE)
#> Warning: character must have 0 arguments
```
