- added `all = TRUE` argument to `check_join()` to check all rows in y in join
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
