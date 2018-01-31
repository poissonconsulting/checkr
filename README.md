
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis-CI Build
Status](https://travis-ci.org/poissonconsulting/checkr.svg?branch=master)](https://travis-ci.org/poissonconsulting/checkr)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/checkr?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/checkr)
[![Coverage
Status](https://img.shields.io/codecov/c/github/poissonconsulting/checkr/master.svg)](https://codecov.io/github/poissonconsulting/checkr?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/checkr)](https://cran.r-project.org/package=checkr)

# checkr

`checkr` is a dependency-free, pipe-friendly R package of expressive,
assertive functions to check the properties of common R objects. In the
case of failure the functions, which are designed to be used in scripts
and packages, issue informative error messages. For a comparison with
similar packages see the `assertive-programming` vignette.

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
#> Warning: dplyr::starwars column names must include 'height', 'name',
#> 'mass', 'hair_color' and 'gender' in that order
#> Warning: column height of dplyr::starwars must not include missing values
#> Warning: the values in column mass of dplyr::starwars must lie between 20
#> and 1358
#> Warning: column hair_color of dplyr::starwars can only include values
#> 'black', 'blond' or 'brown'
#> Warning: dplyr::starwars must not have more than 84 rows
#> Warning: column 'hair_color' in dplyr::starwars must be a unique key
```

The two other main functions are `check_vector()` and `check_list()`.

``` r
y <- c(2,1,0,1,NA)
check_vector(y, values = 1:10, length = 2, unique = TRUE, sorted = TRUE, named = TRUE, error = FALSE)
#> Warning: y must have 2 elements
#> Warning: y must be class integer
#> Warning: y must not include missing values
#> Warning: y has unpermitted values 0
#> Warning: y must be unique
#> Warning: y must be sorted
#> Warning: y must be named
```

## Values

Perhaps the most interesting feature of `checkr` is the use of objects
to check the values of other objects. The expressive yet elegant syntax
that makes this possible is described below.

#### Class

To check the class simply pass an object of the desired class.

``` r
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
#> Error: the values in y must lie between -10 and -1
```

#### Specific Values

To check the vector only includes specific values pass three or more
non-missing values.

``` r
check_vector(y, c(0, 1, 2, NA))
check_vector(y, c(1, 1, 2, NA))
#> Error: y can only include values 1 or 2
```

### Naming Objects

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

## Citation

``` 

To cite package 'checkr' in publications use:

  Joe Thorley (2018). checkr: Check the Properties of Common R
  Objects. R package version 0.0.2.9001.
  https://github.com/poissonconsulting/checkr

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {checkr: Check the Properties of Common R Objects},
    author = {Joe Thorley},
    year = {2018},
    note = {R package version 0.0.2.9001},
    url = {https://github.com/poissonconsulting/checkr},
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
