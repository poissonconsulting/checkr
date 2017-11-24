
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![stability-unstable](https://img.shields.io/badge/stability-unstable-yellow.svg)](https://github.com/joethorley/stability-badges#unstable) [![Travis-CI Build Status](https://travis-ci.org/poissonconsulting/checkr.svg?branch=master)](https://travis-ci.org/poissonconsulting/checkr) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/checkr?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/checkr) [![Coverage Status](https://img.shields.io/codecov/c/github/poissonconsulting/checkr/master.svg)](https://codecov.io/github/poissonconsulting/checkr?branch=master) [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/checkr)](https://cran.r-project.org/package=checkr)

checkr
======

`checkr` is a simple (dependency-free) R package to check the dimensions, classes, values, and names of vectors, lists and data frames. It is designed to be used in scripts or functions to provide informative warnings or errors that allow the user to quickly identify and fix any incorrect inputs.

It has three main functions which are imaginatively named `check_vector`, `check_list` and `check_data`.

### Objects, Warnings and Errors

All functions either throw an informative error or return an invisible copy of the object (which allows them to be used in pipes - but see below).

``` r
library(checkr)
y <- c(2,1,0,1,NA)
check_list(y)
#> Error: y must be a list
print(check_vector(y))
#> [1]  2  1  0  1 NA
```

Additional checks can be enforced by setting the various arguments.

``` r
check_vector(y, values = 1:10, max_length = 2, unique = TRUE, sorted = TRUE, named = TRUE, error = FALSE)
#> Warning: y must be class integer
#> Warning: y must not include missing values
#> Warning: y has unpermitted values 0
#> Warning: y must not be longer than 2
#> Warning: y must be unique
#> Warning: y must be sorted
#> Warning: y must be named
```

If the object fails a check then depending on whether the argument `error` is `FALSE` or `TRUE` one or more informative warnings are issued (and an invisible copy of the object is returned) as in the previous example or an informative error is thrown (the default behaviour), respectively.

``` r
check_vector(y, values = 1:10, max_length = 2, unique = TRUE, sorted = TRUE, named = TRUE)
#> Error: y must be class integer
```

### Values

The values argument can be used to check the class and range etc of a vector, elements of a list or columns of a data frame.

#### Class

To check the class simply pass an object of the desired class.

``` r
check_vector(y, values = numeric(0))
check_vector(y, values = integer(0))
#> Error: y must be class integer
```

#### Missing Values

To check that a vector does not include missing values pass a single non-missing value (of the correct class).

``` r
check_vector(y, 1)
#> Error: y must not include missing values
```

To allow it to include missing values include a missing value.

``` r
check_vector(y, c(1, NA))
```

And to check that it only includes missing values only pass a missing value (of the correct class)

``` r
check_vector(y, NA)
#> Error: y must be class logical
check_vector(y, NA_real_)
#> Error: y must only include missing values
```

#### Range

To check the range pass two non-missing values (as well as the missing value if required).

``` r
check_vector(y, c(0, 2, NA))
check_vector(y, c(1, 3, NA))
#> Error: the values in y must lie between 1 and 3
check_vector(y, c(-1, -10, NA))
#> Error: the values in y must lie between -10 and -1
```

#### Specific Values

To check the vector only includes specific values pass three or more non-missing values.

``` r
check_vector(y, c(0, 1, 2, NA))
check_vector(y, c(1, 1, 2, NA))
#> Error: y can only include values 1 or 2
check_vector(y, c(0, 1, 2, 3, NA))
```

### Naming Objects

By default, the name of an object is determined from the function call.

``` r
check_vector(list(x = 1))
#> Error: list(x = 1) must be an atomic vector
```

This simplifies things but results in less informative error messages when used in a pipe.

``` r
library(magrittr)
y %>% check_list()
#> Error: . must be a list
```

The argument `x_name` can be used to define the name

``` r
y %>% check_list(x_name = "y")
#> Error: y must be a list
```

Inspiration
-----------

[datacheckr](https://github.com/poissonconsulting/datacheckr)

Contribution
------------

Please report any [issues](https://github.com/poissonconsulting/checkr/issues).

[Pull requests](https://github.com/poissonconsulting/checkr/pulls) are always welcome.

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
