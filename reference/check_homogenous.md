# Check Homogenous

Checks whether the elements of x are all of the same class. It works on
vectors, matrices and arrays which, by definition will always be
homogenous and lists and data frames which may or may not be homogenous.

## Usage

``` r
check_homogenous(
  x,
  strict = FALSE,
  recursive = FALSE,
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The object to check.

- strict:

  A flag indicating whether all the objects must have identical classes
  or just share one or more classes.

- recursive:

  A flag indicating whether the check should be applied recursively.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_vector()`](https://poissonconsulting.github.io/checkr/reference/check_vector.md),
[`check_list()`](https://poissonconsulting.github.io/checkr/reference/check_list.md)
and
[`check_data()`](https://poissonconsulting.github.io/checkr/reference/check_data.md)

## Examples

``` r
check_homogenous(1:2)
#> Warning: `check_homogenous()` was deprecated in checkr 0.5.1.
check_homogenous(list(1,2))
check_homogenous(list(1,TRUE), error = FALSE)
#> Warning: all elements in list(1, TRUE) must inherit from the same class
```
