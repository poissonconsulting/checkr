# Check Proportions

Checks if x is proportions vector - non-missing dbls between 0 and 1
that sum to 1.

## Usage

``` r
check_props(x, x_name = substitute(x), error = TRUE)
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
