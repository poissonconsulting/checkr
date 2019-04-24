
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Travis-CI Build
Status](https://travis-ci.org/poissonconsulting/checkr.svg?branch=master)](https://travis-ci.org/poissonconsulting/checkr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/checkr?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/checkr)
[![Coverage
Status](https://img.shields.io/codecov/c/github/poissonconsulting/checkr/master.svg)](https://codecov.io/github/poissonconsulting/checkr?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/checkr)](https://cran.r-project.org/package=checkr)
![CRAN Downloads](http://cranlogs.r-pkg.org/badges/grand-total/checkr)
[![JOSS](http://joss.theoj.org/papers/10.21105/joss.00624/status.svg)](https://doi.org/10.21105/joss.00624)

# checkr

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
#> Error in cc_and(colnames): could not find function "cc_and"
```

## Syntax

`checkr` uses objects to check the values of other objects using an
elegant and expressive syntax.

#### Class

To check the class simply pass an object of the desired class.

``` r
y <- c(2,1,0,1,NA)
check_vector(y, values = numeric(0))
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
#> Error in cc_and(values[1:2]): could not find function "cc_and"
```

#### Specific Values

To check the vector only includes specific values pass three or more
non-missing values or set `only = TRUE`.

``` r
check_vector(y, c(0, 1, 2, NA))
check_vector(y, c(1, 1, 2, NA))
#> Error in cc_or(values): could not find function "cc_or"
check_vector(y, c(1, 2, NA), only = TRUE)
#> Error in cc_or(values): could not find function "cc_or"
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
y %>% check_list()
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
#> Error: x must not include missing values
fun(x = TRUE)
fun(x = 1)
#> Error: x must be class logical
```

Additional scalar wrappers are `check_date()` and `check_dttm()` for
scalar Date and POSIXct objects. Alternatively you can roll your own
using the more general `check_scalar()` function.

## Installation

To install the latest official release from
[CRAN](https://CRAN.R-project.org/package=checkr)

    install.packages("checkr")

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/checkr)

    install.packages("devtools")
    devtools::install_github("poissonconsulting/err")
    devtools::install_github("poissonconsulting/checkr")

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("checkr")

## Citation

``` 

To cite checkr in publications use:

  Joe Thorley (2018). checkr: An R package for Assertive
  Programming. Journal of Open Source Software, 3(23), 624. URL
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
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/checkr/issues).

[Pull requests](https://github.com/poissonconsulting/checkr/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.

## Inspiration

[datacheckr](https://github.com/poissonconsulting/datacheckr)
