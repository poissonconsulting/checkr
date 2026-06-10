# checkr Naming Schemes

The `checkr` packages provides a series of functions that can be used to
check the values and classes of common R objects. Before attempting to
use the functions it is worth understanding the checkr function naming
schemes.

## Primary Objects

As discussed in the [Data
Structures](http://adv-r.had.co.nz/Data-structures.md) chapter in
Advanced R by Hadley Wickham, the five main object types are defined by
their dimensionality (1d, 2d and nd) and whether they are homogenous or
heterogenous. Currently the
[`check_vector()`](https://poissonconsulting.github.io/checkr/reference/check_vector.md),
[`check_list()`](https://poissonconsulting.github.io/checkr/reference/check_list.md)
and
[`check_data()`](https://poissonconsulting.github.io/checkr/reference/check_data.md)
functions allow the user to check the type and values of the three main
type of (atomic) vectors, lists and data frames. The
[`check_matrix()`](https://mllg.github.io/checkmate/reference/checkMatrix.html)
and
[`check_array()`](https://mllg.github.io/checkmate/reference/checkArray.html)
equivalents have yet to be implemented. The functions are named
according to the type of the object they check.

It is worth noting that a while a vector, matrix or array will
definitely pass the
[`check_homogenous()`](https://poissonconsulting.github.io/checkr/reference/check_homogenous.md)
function, a list or data frame may pass it if all its elements have
identical classes.

## Scalars

In addition to (atomic) vectors the checkr package also identifies
scalars which in R are (atomic) vectors with one element. They can be
tested using the
[`check_scalar()`](https://poissonconsulting.github.io/checkr/reference/check_scalar.md)
function.

Often function arguments are scalars of a particular type. For example
the default [`mean()`](https://rdrr.io/r/base/mean.html) function has an
argument `na.rm` which is a logical indicating whether `NA` values
should be stripped. The checkr package provides the following functions
to test whether objects are non-missing scalars of particular types:

- [`check_lgl()`](https://poissonconsulting.github.io/checkr/reference/check_lgl.md):
  a non-missing logical scalar i.e. `TRUE` or `FALSE`
- [`check_int()`](https://poissonconsulting.github.io/checkr/reference/check_int.md):
  an non-missing integer i.e. 1L
- [`check_dbl()`](https://poissonconsulting.github.io/checkr/reference/check_dbl.md):
  an non-missing double scalar i.e. 1.1
- [`check_prop()`](https://poissonconsulting.github.io/checkr/reference/check_prob.md):
  a non-missing double scalar between zero and one, i.e. 0.35
- [`check_chr()`](https://poissonconsulting.github.io/checkr/reference/check_chr.md):
  a non-missing character scalar, i.e. `"text"`
- [`check_date()`](https://poissonconsulting.github.io/checkr/reference/check_date.md):
  a non-missing Date scalar i.e. `as.Date("2001-02-03")`
- [`check_dttm()`](https://poissonconsulting.github.io/checkr/reference/check_dttm.md):
  a non-missing POSIXct scalar

It is also worth noting that almost all the scalar functions include an
argument `coerce` which if set to `TRUE` tests whether the object
satisfies the condition after coercing to the required type. If the test
passes then the function returns the coerced object.

## Other Objects

Functions to test whether an object is another type of object include
[`check_null()`](https://poissonconsulting.github.io/checkr/reference/check_null.md),
[`check_environment()`](https://poissonconsulting.github.io/checkr/reference/check_environment.md)
and
[`check_function()`](https://poissonconsulting.github.io/checkr/reference/check_function.md).

In addition the
[`check_classes()`](https://poissonconsulting.github.io/checkr/reference/check_classes.md)
and
[`check_inherits()`](https://poissonconsulting.github.io/checkr/reference/check_inherits.md)
functions can be used to check the classes or inheritance of an object.

## Function Functions

Many other checking functions are named according to the main base
function that they use. Thus the
[`check_nrow()`](https://poissonconsulting.github.io/checkr/reference/check_nrow.md)
function uses the [`nrow()`](https://rdrr.io/r/base/nrow.html) function
to check the number of rows while the
[`check_nlevels()`](https://poissonconsulting.github.io/checkr/reference/check_nlevels.md)
function uses the [`nlevels()`](https://rdrr.io/r/base/nlevels.html)
function. It is important to realize that these functions do not check
the type of an object but simply whether the return value of the base
function(s) is consistent with the user defined conditions.

Functions which fall in this category include
[`check_class()`](https://mllg.github.io/checkmate/reference/checkClass.html),
[`check_colnames()`](https://poissonconsulting.github.io/checkr/reference/check_colnames.md),
[`check_length()`](https://poissonconsulting.github.io/checkr/reference/check_length.md),
[`check_levels()`](https://poissonconsulting.github.io/checkr/reference/check_levels.md),
[`check_names()`](https://poissonconsulting.github.io/checkr/reference/check_names.md),
[`check_nchar()`](https://poissonconsulting.github.io/checkr/reference/check_nchar.md),
[`check_ncol()`](https://poissonconsulting.github.io/checkr/reference/check_ncol.md),
[`check_nlevels()`](https://poissonconsulting.github.io/checkr/reference/check_nlevels.md),
[`check_nrow()`](https://poissonconsulting.github.io/checkr/reference/check_nrow.md)
and
[`check_sorted()`](https://poissonconsulting.github.io/checkr/reference/check_sorted.md).

## Data Functions

The
[`check_join()`](https://poissonconsulting.github.io/checkr/reference/check_join.md)
function tests whether the columns in one data frame form a many-to-one
join with corresponding columns in a second data frame. The
[`check_key()`](https://poissonconsulting.github.io/checkr/reference/check_key.md)
function tests whether specific columns are unique. They are useful for
testing whether a set of data frames can be archived in an relational
database.

## Miscellaneous Functions

The remaining functions which are not captured by the above naming
schemes include
[`checkor()`](https://poissonconsulting.github.io/checkr/reference/checkor.md),
[`check_named()`](https://poissonconsulting.github.io/checkr/reference/check_named.md),
[`check_pattern()`](https://poissonconsulting.github.io/checkr/reference/check_pattern.md),
[`check_regex()`](https://poissonconsulting.github.io/checkr/reference/check_grepl.md),
[`check_sorted()`](https://poissonconsulting.github.io/checkr/reference/check_sorted.md),
[`check_tzone()`](https://poissonconsulting.github.io/checkr/reference/check_tzone.md),
[`check_unique()`](https://poissonconsulting.github.io/checkr/reference/check_unique.md),
[`check_unnamed()`](https://poissonconsulting.github.io/checkr/reference/check_unnamed.md)
and
[`check_unused()`](https://poissonconsulting.github.io/checkr/reference/check_unused.md).
