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
