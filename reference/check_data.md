# Check Data

Checks whether an object is a data frame. Can also check the number of
rows, the names and order and values of the columns as well as whether
particular columns form a unique key.

## Usage

``` r
check_data(
  x,
  values = NULL,
  nrow = NA,
  exclusive = FALSE,
  order = FALSE,
  key = character(0),
  x_name = substitute(x),
  error = TRUE
)
```

## Arguments

- x:

  The object to check.

- values:

  NULL (default) or a character vector specifying the column names or a
  named list specifying the column names and values.

- nrow:

  A flag indicating whether x should have rows (versus no rows) or a
  missing value indicating no requirements or a count or count range of
  the number of rows.

  @return An invisible copy of x (if it doesn't throw an error).

- exclusive:

  A flag indicating whether other columns are not permitted.

- order:

  A flag indicating whether the columns have to occur in the same order
  as values.

- key:

  A character vector of the columns that represent a unique key.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

## Value

An invisible copy of x (if it doesn't throw an error).

## See also

[`check_colnames()`](https://poissonconsulting.github.io/checkr/reference/check_colnames.md),
[`check_nrow()`](https://poissonconsulting.github.io/checkr/reference/check_nrow.md)
and
[`check_key()`](https://poissonconsulting.github.io/checkr/reference/check_key.md)

## Examples

``` r
z <- data.frame(
 Count = c(0L, 3L, 3L, 0L, NA), 
  Longitude = c(0, 0, 90, 90, 180), 
  Latitude = c(0, 90, 90.2, 100, -180),
  Type = factor(c("Good", "Bad", "Bad", "Bad", "Bad"), levels = c("Good", "Bad")),
  Extra = TRUE,
  Comments = c("In Greenwich", "Somewhere else", "I'm lost", 
    "I didn't see any", "Help"), 
  stringsAsFactors = FALSE)

check_data(z, values = list(
  Count = 1,
  Extra = NA,
  Latitude = c(45, 90)
  ), exclusive = TRUE, order = TRUE, nrow = 10L, key = "Longitude", error = FALSE)
#> Warning: `check_data()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_data()` instead.
#> Warning: z column names must be identical to 'Count', 'Extra' and 'Latitude'
#> Warning: column Count of z must be class numeric
#> Warning: column Count of z must inherit from classes 'numeric' in that order
#> Warning: column Count of z must not include missing values
#> Warning: column Extra of z must only include missing values
#> Warning: the values in column Latitude of z must lie between 45 and 90
#> Warning: z must have 10 rows
#> Warning: column 'Longitude' in z must be a unique key
```
