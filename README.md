
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![stability-unstable](https://img.shields.io/badge/stability-unstable-yellow.svg)](https://github.com/joethorley/stability-badges#unstable) [![Travis-CI Build Status](https://travis-ci.org/poissonconsulting/checkr.svg?branch=master)](https://travis-ci.org/poissonconsulting/checkr) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/checkr?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/checkr) [![Coverage Status](https://img.shields.io/codecov/c/github/poissonconsulting/checkr/master.svg)](https://codecov.io/github/poissonconsulting/checkr?branch=master) [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/checkr)](https://cran.r-project.org/package=checkr)

checkr
======

`checkr` in an R package to informatively check the dimensions, classes, values, and names of vectors, lists and data frames.

Installation
------------

``` r
# install.packages("devtools")
devtools::install_github("poissonconsulting/checkr")
```

Demonstration
-------------

``` r
library(checkr)
x <- c(2,1,0,1,NA)

check_vector(x)

check_vector(x, values = 1:10, max_length = 2, unique = TRUE, sorted = TRUE, named = TRUE, error = FALSE)
#> Warning: x must be of class integer
#> Warning: x must not include missing values
#> Warning: x has unpermitted values 0
#> Warning: x must not be longer than 2
#> Warning: x must be unique
#> Warning: x must be sorted
#> Warning: x must be named

check_vector("term", c("term1", "term2"), error = FALSE)
#> Warning: the values in term must lie between 'term1' and 'term2'

y <- -1
checkor(check_count(y), check_flag(y), error = FALSE)
#> Warning: 
#>   y must be of class integer OR 
#>   y must be of class logical
```

Contribution
------------

Please report any [issues](https://github.com/poissonconsulting/checkr/issues).

[Pull requests](https://github.com/poissonconsulting/checkr/pulls) are always welcome.

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
