# Parameters for checkr functions

Descriptions of the parameters for the checkr functions.

## Arguments

- x:

  The object to check.

- x_name:

  A string of the name of the object x.

- error:

  A flag indicating whether to throw an informative error or immediately
  generate an informative message if the check fails.

- pattern:

  A string of the regular expression.

- y_name:

  A string of the name of the object y.

- values:

  NULL or a vector specifying the values.

- exclusive:

  A flag indicating whether other columns are not permitted.

- by:

  A character vector or named character vector of the columns to join
  by.

- colnames:

  A character vector of the column names.

- na_distinct:

  A flag specifying whether missing values should be considered
  distinct.

- sorted:

  A flag indicating whether the vector must be sorted.

- only:

  A flag indicating whether only the actual values are permitted. It
  only affects values with two or less non-missing elements.

- unique:

  A flag indicating whether the values must be unique.

- length:

  A flag indicating whether x should have elements (versus no elements)
  or a missing value indicating no requirements or a count or count
  range of the number of elements or a count vector of the permitted
  number of elements.

- complete:

  A flag indicating whether all the possible names have to be
  represented.

- coerce:

  A flag indicating whether to coerce a scalar integer to a dbl and drop
  attributes including names.

- tzone:

  A string of the time zone.

- strict:

  A flag indicating whether all the objects must have identical classes
  or just share one or more classes.

- recursive:

  A flag indicating whether the check should be applied recursively.

- ncol:

  A flag indicating whether x should have columns (versus no columns) or
  a missing value indicating no requirements or a count or count range
  of the number of columns.

- nlevels:

  A flag indicating whether x should have elements (versus no elements)
  or a missing value indicating no requirements or a count or count
  range of the number of elements.

- nrow:

  A flag indicating whether x should have rows (versus no rows) or a
  missing value indicating no requirements or a count or count range of
  the number of rows.

- nargs:

  A count of the number of arguments or count range of the minimum and
  maximum number of arguments.

- levels:

  A character vector of the levels.
