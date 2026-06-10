# Changelog

## checkr 0.5.0

CRAN release: 2019-04-25

- fixed check_key with no columns
- added units testing
- added `names = TRUE` and `class = TRUE` arguments to
  [`check_attributes()`](https://poissonconsulting.github.io/checkr/reference/check_attributes.md),
  [`check_no_attributes()`](https://poissonconsulting.github.io/checkr/reference/check_no_attributes.md)
  and
  [`check_vector()`](https://poissonconsulting.github.io/checkr/reference/check_vector.md)
- added `na_distinct = FALSE` argument to `check_key`
- replace internal `deparse_x_name()` with exported
  [`chk_deparse()`](https://poissonconsulting.github.io/checkr/reference/chk_deparse.md)
- added
  [`check_name()`](https://poissonconsulting.github.io/checkr/reference/check_name.md)
  to check if elements of character vector are each a syntactically
  valid name
- [`check_named()`](https://poissonconsulting.github.io/checkr/reference/check_named.md)
  now only gives 1 warning if error = FALSE and not named
- removed `check_tz()`

## checkr 0.4.0

CRAN release: 2018-11-01

### Major Changes

- added `err` as dependency for message generation
- `check_data` argument `values` now NULL by default (as opposed to
  missing)
- lengths including nrows and ncols can now be checked by a vector of
  possible values
- `coerce = TRUE` now also strips attributes for flag, int, dbl, string
  and logical, integer, double, character.

### Exported

- exported
  [`chk_deparse()`](https://poissonconsulting.github.io/checkr/reference/chk_deparse.md)
  to deparse dealing with NAs for packages which extend
- exported
  [`chk_fail()`](https://poissonconsulting.github.io/checkr/reference/chk_fail.md)
  to have conditional error or warning messages for packages which
  extend.
- exported
  [`chk_max_int()`](https://poissonconsulting.github.io/checkr/reference/chk_max_int.md),
  [`chk_min_int()`](https://poissonconsulting.github.io/checkr/reference/chk_min_int.md),
  [`chk_min_dbl()`](https://poissonconsulting.github.io/checkr/reference/chk_min_dbl.md),
  [`chk_max_dbl()`](https://poissonconsulting.github.io/checkr/reference/chk_max_dbl.md)
  and
  [`chk_tiny_dbl()`](https://poissonconsulting.github.io/checkr/reference/chk_tiny_dbl.md)
  to get integer and numeric ranges for system.

### New Functions

- added
  [`check_intersection()`](https://poissonconsulting.github.io/checkr/reference/check_intersection.md)
  to check the intersection between two atomic vectors
- added
  [`check_integer()`](https://poissonconsulting.github.io/checkr/reference/check_integer.md),
  [`check_numeric()`](https://poissonconsulting.github.io/checkr/reference/check_numeric.md),
  [`check_double()`](https://poissonconsulting.github.io/checkr/reference/check_numeric.md),
  [`check_logical()`](https://poissonconsulting.github.io/checkr/reference/check_logical.md)
  and
  [`check_character()`](https://poissonconsulting.github.io/checkr/reference/check_character.md)
- added
  [`check_int()`](https://poissonconsulting.github.io/checkr/reference/check_int.md)
  and
  [`check_dbl()`](https://poissonconsulting.github.io/checkr/reference/check_dbl.md)
  both of which do coercion
- added
  [`check_prob()`](https://poissonconsulting.github.io/checkr/reference/check_prob.md)
  to check a probability
- added
  [`check_pos_dbl()`](https://poissonconsulting.github.io/checkr/reference/check_pos_dbl.md),
  [`check_neg_dbl()`](https://poissonconsulting.github.io/checkr/reference/check_neg_dbl.md)
  and
  [`check_noneg_dbl()`](https://poissonconsulting.github.io/checkr/reference/check_noneg_dbl.md)
- added
  [`check_pos_int()`](https://poissonconsulting.github.io/checkr/reference/check_pos_int.md),
  [`check_neg_int()`](https://poissonconsulting.github.io/checkr/reference/check_neg_int.md)
  and
  [`check_noneg_int()`](https://poissonconsulting.github.io/checkr/reference/check_noneg_int.md)
- added
  [`check_attributes()`](https://poissonconsulting.github.io/checkr/reference/check_attributes.md)
  to check an objects attributes and
  [`check_no_attributes()`](https://poissonconsulting.github.io/checkr/reference/check_no_attributes.md)
- added
  [`check_lgl()`](https://poissonconsulting.github.io/checkr/reference/check_lgl.md),
  [`check_chr()`](https://poissonconsulting.github.io/checkr/reference/check_chr.md),
  [`check_day()`](https://poissonconsulting.github.io/checkr/reference/check_date.md),
  [`check_dttm()`](https://poissonconsulting.github.io/checkr/reference/check_dttm.md)
- added
  [`check_grepl()`](https://poissonconsulting.github.io/checkr/reference/check_grepl.md)

### New Arguments

- added `attributes` argument to
  [`check_vector()`](https://poissonconsulting.github.io/checkr/reference/check_vector.md)
  and
  [`check_scalar()`](https://poissonconsulting.github.io/checkr/reference/check_scalar.md)
  which now only accept a flag for named
- added `complete = TRUE` argument to
  [`check_names()`](https://poissonconsulting.github.io/checkr/reference/check_names.md)
- added `exclusive = FALSE` and `order = FALSE` to
  [`check_list()`](https://poissonconsulting.github.io/checkr/reference/check_list.md)

### Deprecated

- deprecated `unique = FALSE`, `length = NA` and `named = NA` from
  [`check_list()`](https://poissonconsulting.github.io/checkr/reference/check_list.md)
  as checked through `values` argument or with specific functions
- deprecated
  [`check_regex()`](https://poissonconsulting.github.io/checkr/reference/check_grepl.md)
  and
  [`check_pattern()`](https://poissonconsulting.github.io/checkr/reference/check_pattern.md)
  (and added
  [`check_grepl()`](https://poissonconsulting.github.io/checkr/reference/check_grepl.md))
  and deprecated `regex` argument for `pattern` argument
- deprecated
  [`check_flag_na()`](https://poissonconsulting.github.io/checkr/reference/check_flag_na.md)

## checkr 0.3.0

CRAN release: 2018-06-27

- redefined `check_scalar` (following previous deprecation)
- added `only = FALSE` argument to
  [`check_vector()`](https://poissonconsulting.github.io/checkr/reference/check_vector.md)
  to check whether only the actual values are permitted.
- added
  [`check_rbind()`](https://poissonconsulting.github.io/checkr/reference/check_rbind.md)
  to check two data frames can be smoothly `rbind`ed

## checkr 0.2.0

CRAN release: 2018-03-26

- deprecated `check_tz()` for
  [`check_tzone()`](https://poissonconsulting.github.io/checkr/reference/check_tzone.md)
- added
  [`check_unused()`](https://poissonconsulting.github.io/checkr/reference/check_unused.md)
  to check `...` is unused within a function
- added
  [`check_homogenous()`](https://poissonconsulting.github.io/checkr/reference/check_homogenous.md)
  to check object’s elements are the same class
- added
  [`check_flag_na()`](https://poissonconsulting.github.io/checkr/reference/check_flag_na.md)
  to check is scalar logical

## checkr 0.1.0

CRAN release: 2018-03-02

- added
  [`check_nchar()`](https://poissonconsulting.github.io/checkr/reference/check_nchar.md)
  function
- [`check_vector()`](https://poissonconsulting.github.io/checkr/reference/check_vector.md)
  and
  [`check_list()`](https://poissonconsulting.github.io/checkr/reference/check_list.md)
  now allow `named` argument to be a regular expression or count range
- added `nchar = c(0L, .Machine$max.integer)` and `regex = ".*"`
  arguments to
  [`check_named()`](https://poissonconsulting.github.io/checkr/reference/check_named.md)
- added
  [`check_regex()`](https://poissonconsulting.github.io/checkr/reference/check_grepl.md)
  function
- added `all_y = TRUE` argument to
  [`check_join()`](https://poissonconsulting.github.io/checkr/reference/check_join.md)
  to check all rows in y in join
- changed
  [`check_join()`](https://poissonconsulting.github.io/checkr/reference/check_join.md)
  error message to  
  *…join in x and y must include all the rows in x* as opposed to *…join
  in x and y violates referential integrity*
- added
  [`check_number()`](https://poissonconsulting.github.io/checkr/reference/check_dbl.md)
  to check that object is a scalar real
- added `assertive-programming` vignette
- vector length are now checked before values
- lengths can now be specified using `TRUE`, `FALSE` or `NA` (# 2)

## checkr 0.0.2

CRAN release: 2018-01-29

- added
  [`check_inherits()`](https://poissonconsulting.github.io/checkr/reference/check_inherits.md)
  and
  [`check_classes()`](https://poissonconsulting.github.io/checkr/reference/check_classes.md)
  functions
- [`check_named()`](https://poissonconsulting.github.io/checkr/reference/check_named.md)
  now only checks unique when `unique = TRUE`
- [`check_names()`](https://poissonconsulting.github.io/checkr/reference/check_names.md)
  (and
  [`check_colnames()`](https://poissonconsulting.github.io/checkr/reference/check_colnames.md))
  can now check names are unique and also accept `names = character(0)`
  (and `colnames = character(0)`)

## checkr 0.0.1

- first official release
