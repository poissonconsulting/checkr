- added `na_distinct = FALSE` argument to `check_key`
- replace internal `deparse_x_name()` with exported `chk_deparse()`
- added `check_name()` to check if elements of character vector are each a syntactically valid name
- `check_named()` now only gives 1 warning if error = FALSE and not named
- removed `check_tz()`

# checkr 0.4.0

## Major Changes

- added `err` as dependency for message generation
- `check_data` argument `values` now NULL by default (as opposed to missing)
- lengths including nrows and ncols can now be checked by a vector of possible values
- `coerce = TRUE` now also strips attributes for flag, int, dbl, string and logical, integer, double, character.

## Exported

- exported `chk_deparse()` to deparse dealing with NAs for packages which extend
- exported `chk_fail()` to have conditional error or warning messages for packages which extend.
- exported `chk_max_int()`, `chk_min_int()`, `chk_min_dbl()`, `chk_max_dbl()` and `chk_tiny_dbl()` to get integer and numeric ranges for system.

## New Functions

- added `check_intersection()` to check the intersection between two atomic vectors
- added `check_integer()`, `check_numeric()`, `check_double()`, `check_logical()` and `check_character()`
- added `check_int()` and `check_dbl()` both of which do coercion
- added `check_prob()` to check a probability
- added `check_pos_dbl()`, `check_neg_dbl()` and `check_noneg_dbl()`
- added `check_pos_int()`, `check_neg_int()` and `check_noneg_int()`
- added `check_attributes()` to check an objects attributes and `check_no_attributes()`
- added `check_lgl()`, `check_chr()`, `check_day()`, `check_dttm()`
- added `check_grepl()`

## New Arguments

- added `attributes` argument to `check_vector()` and `check_scalar()` which now only accept a flag for named
- added `complete = TRUE` argument to `check_names()`
- added `exclusive = FALSE` and `order = FALSE` to `check_list()`

## Deprecated

- deprecated `unique = FALSE`, `length = NA` and `named = NA` from `check_list()` as checked through `values` argument or with specific functions
- deprecated `check_regex()` and `check_pattern()` (and added `check_grepl()`)
and deprecated `regex` argument for `pattern` argument
- deprecated `check_flag_na()`

# checkr 0.3.0

- redefined `check_scalar` (following previous deprecation)
- added `only = FALSE` argument to `check_vector()` to check whether 
only the actual values are permitted.
- added `check_rbind()` to check two data frames can be smoothly `rbind`ed

# checkr 0.2.0

- deprecated `check_tz()` for `check_tzone()`
- added `check_unused()` to check `...` is unused within a function
- added `check_homogenous()` to check object's elements are the same class
- added `check_flag_na()` to check is scalar logical

# checkr 0.1.0

- added `check_nchar()` function
- `check_vector()` and `check_list()` now allow `named` argument to be a regular expression or count range
- added `nchar = c(0L, .Machine$max.integer)` and `regex = ".*"` arguments to `check_named()`
- added `check_regex()` function
- added `all_y = TRUE` argument to `check_join()` to check all rows in y in join
- changed `check_join()` error message to  
    *...join in x and y must include all the rows in x* as opposed to
    *...join in x and y violates referential integrity*
- added `check_number()` to check that object is a scalar real
- added `assertive-programming` vignette
- vector length are now checked before values
- lengths can now be specified using `TRUE`, `FALSE` or `NA` (# 2)

# checkr 0.0.2

- added `check_inherits()` and `check_classes()` functions
- `check_named()` now only checks unique when `unique = TRUE`
- `check_names()` (and `check_colnames()`) can now check names are unique and 
also accept `names = character(0)` (and `colnames = character(0)`)

# checkr 0.0.1

- first official release
