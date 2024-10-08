
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![Lifecycle:
superseded](https://img.shields.io/badge/lifecycle-superseded-blue.svg)](https://lifecycle.r-lib.org/articles/stages.html#superseded)
[![R-CMD-check](https://github.com/poissonconsulting/checkr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/checkr/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/checkr/graph/badge.svg)](https://app.codecov.io/gh/poissonconsulting/checkr)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![JOSS](http://joss.theoj.org/papers/10.21105/joss.00624/status.svg)](https://doi.org/10.21105/joss.00624)
<!-- badges: end -->

# checkr

`checkr` has been superseded by the
[`chk`](https://github.com/poissonconsulting/chk) package.

`checkr` is a light-weight R package of expressive, assertive,
pipe-friendly functions to check the properties of common R objects.

In the case of failure the functions, which are designed to be used in
scripts and packages, issue informative error messages.

For an overview of the functions see the `checkr-naming` vignette and
for a comparison with similar packages see the `assertive-programming`
vignette.

## Demonstration

The following code demonstrates the `check_data()` function

``` r
library(checkr)

# the starwars data frame in the dplyr package fails many of these checks
check_data(dplyr::starwars, values = list(
  height = c(66L, 264L),
  name = "",
  mass = c(20,1358, NA),
  hair_color = c("blond", "brown", "black", NA),
  gender = c("male", "female", "hermaphrodite", "none", NA)), 
    order = TRUE, nrow = c(81, 84), key = "hair_color", error = FALSE)
#> Warning: `check_data()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::check_data()` instead.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
#> Warning: dplyr::starwars column names must include 'height', 'name', 'mass',
#> 'hair_color' and 'gender' in that order
#> Warning: column height of dplyr::starwars must not include missing values
#> Warning: the values in column mass of dplyr::starwars must lie between 20 and
#> 1358
#> Warning: column hair_color of dplyr::starwars can only include values 'black',
#> 'blond' or 'brown'
#> Warning: column gender of dplyr::starwars can only include values 'female',
#> 'hermaphrodite', 'male' or 'none'
#> Warning: dplyr::starwars must not have more than 84 rows
#> Warning: column 'hair_color' in dplyr::starwars must be a unique key
```

## Syntax

`checkr` uses objects to check the values of other objects using an
elegant and expressive syntax.

#### Class

To check the class simply pass an object of the desired class.

``` r
y <- c(2,1,0,1,NA)
check_vector(y, values = numeric(0))
#> Warning: `check_vector()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_vector(), chk::check_dim(), chk::chk_unique(),
#>   chk::chk_sorted(), chk::chk_named(), and/or chk::check_values() instead.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
check_vector(y, values = integer(0))
#> Error: y must be class integer
```

#### Missing Values

To check that a vector does not include missing values pass a single
non-missing value (of the correct class).

``` r
check_vector(y, 1)
#> Error: y must not include missing values
```

To allow it to include missing values include a missing value.

``` r
check_vector(y, c(1, NA))
```

And to check that it only includes missing values only pass a missing
value (of the correct class)

``` r
check_vector(y, NA_real_)
#> Error: y must only include missing values
```

#### Range

To check the range of a vector pass two non-missing values (as well as
the missing value if required).

``` r
check_vector(y, c(0, 2, NA))
check_vector(y, c(-1, -10, NA))
#> Error: the values in y must lie between -10 and -1
```

#### Specific Values

To check the vector only includes specific values pass three or more
non-missing values or set `only  = TRUE`.

``` r
check_vector(y, c(0, 1, 2, NA))
check_vector(y, c(1, 1, 2, NA))
#> Error: y can only include values 1 or 2
check_vector(y, c(1, 2, NA), only = TRUE)
#> Error: y can only include values 1 or 2
```

## Naming Objects

By default, the name of an object is determined from the function call.

``` r
check_vector(list(x = 1))
#> Error: list(x = 1) must be an atomic vector
```

This simplifies things but results in less informative error messages
when used in a pipe.

``` r
library(magrittr)
#> 
#> Attaching package: 'magrittr'
#> The following objects are masked from 'package:testthat':
#> 
#>     equals, is_less_than, not
y %>% check_list()
#> Warning: `check_list()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_list(), chk::check_dim(), chk::chk_unique(),
#>   chk::chk_named(), and/or chk::check_values() instead.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
#> Error: . must be a list
```

The argument `x_name` can be used to override the name.

``` r
y %>% check_list(x_name = "y")
#> Error: y must be a list
```

## Scalars

The four wrapper functions `check_lgl()`, `check_int()`, `check_dbl()`
and `check_str()` check whether an object is an attribute-less
non-missing scalar logical (flag), integer, double (number) or character
(string). They are really useful for checking the types of arguments in
functions

``` r
fun <- function(x) { check_lgl(x)}
fun(x = NA)
#> Warning: `check_lgl()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chk_lgl()` instead.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
#> Error: x must not include missing values
fun(x = TRUE)
fun(x = 1)
#> Error: x must be class logical
```

Additional scalar wrappers are `check_date()` and `check_dttm()` for
scalar Date and POSIXct objects. Alternatively you can roll your own
using the more general `check_scalar()` function.

## Installation

To install the latest development version from
[r-universe](https://poissonconsulting.r-universe.dev/checkr).

``` r
install.packages("checkr", repos = c("https://poissonconsulting.r-universe.dev", "https://cloud.r-project.org"))
```

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/checkr)

``` r
# install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))
pak::pak("poissonconsulting/checkr")
```

## Citation

    To cite checkr in publications use:

      Joe Thorley (2018). checkr: An R package for Assertive Programming.
      Journal of Open Source Software, 3(23), 624. URL
      https://doi.org/10.21105/joss.00624

    A BibTeX entry for LaTeX users is

      @Article{,
        title = {checkr: {An} {R} package for {Assertive} {Programming}},
        author = {Joe Thorley},
        journal = {Journal of Open Source Software},
        year = {2018},
        volume = {3},
        number = {23},
        pages = {624},
        url = {http://joss.theoj.org/papers/10.21105/joss.00624},
      }

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/checkr/issues).

[Pull requests](https://github.com/poissonconsulting/checkr/pulls) are
always welcome.

## Code of Conduct

Please note that the checkr project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms
