# Check Flag or NA

Checks if x is a flag or NA (missing logical scalar).

## Usage

``` r
check_flag_na(x, coerce = TRUE, x_name = substitute(x), error = TRUE)
```

## Arguments

- x:

  The object to check.

- coerce:

  A flag indicating whether to drop attributes including names.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## Details

Useful when using flag to pass one of three options.
