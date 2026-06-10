# Check Atomic Vector

Check Atomic Vector

## Usage

``` r
check_vector(
  x,
  values = NULL,
  length = NA,
  unique = FALSE,
  sorted = FALSE,
  named = NA,
  attributes = named,
  names = TRUE,
  class = TRUE,
  only = FALSE,
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The object to check.

- values:

  NULL or a vector specifying the values.

- length:

  A flag indicating whether x should have elements (versus no elements)
  or a missing value indicating no requirements or a count or count
  range of the number of elements or a count vector of the permitted
  number of elements.

- unique:

  A flag indicating whether the values must be unique.

- sorted:

  A flag indicating whether the vector must be sorted.

- named:

  A flag indicating whether the vector must be named or unnamed or NA if
  it doesn't matter.

- attributes:

  A flag indicating whether the vector must or must not have attributes
  or NA if it doesn't matter.

- names:

  A flag specifying whether names should be considered an attribute.

- class:

  A flag specifying whether class should be considered an attribute.

- only:

  A flag indicating whether only the actual values are permitted. It
  only affects values with two or less non-missing elements.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## Examples

``` r
check_vector(2:1, length = 3, sorted = TRUE, named = TRUE, error = FALSE)
#> Warning: `check_vector()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_vector(), chk::check_dim(), chk::chk_unique(),
#>   chk::chk_sorted(), chk::chk_named(), and/or chk::check_values() instead.
#> Warning: 2:1 must have 3 elements
#> Warning: 2:1 must be sorted
#> Warning: 2:1 must be named
#> Warning: 2:1 must have attributes
check_vector(c("one", "two", "four"), values = c("one", "two", "two"), error = FALSE)
#> Warning: c("one", "two", "four") can only include values 'one' or 'two'
```
