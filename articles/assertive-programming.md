# Packages for Assertive Programming

Assertive programming follows the principles of fail fast and fail
visibly. It is implemented by issuing an informative error message if
the function arguments fail to satisfy specific criteria. This is
particularly important in R because it is a dynamically typed language.

There are a host of R packages to facilitate assertive programming. Here
I am interested in those packages that are

1.  on CRAN;
2.  lightweight (few or no dependencies);
3.  can be used to test the types and values of common R objects (not
    just data frames);
4.  issue error messages.

The most useful packages that I am aware of that satisfy these criteria
are

- [base](https://github.com/hadley/assertthat)
- [assertthat](https://github.com/hadley/assertthat)
- [checkmate](https://github.com/mllg/checkmate)
- [checkr](https://github.com/poissonconsulting/checkr)

This vignette consists of an overview of each package followed by a
comparison.

In short the `checkr` package is recommended over the alternatives if
you are looking for a set of expressive, light-weight, pipe-friendly
assertive functions with customizable object names.

## Package Overview

### base

The `base` package offers the
[`stopifnot()`](https://rdrr.io/r/base/stopifnot.html) function.

``` r

height <- dplyr::starwars$height
stopifnot(is.character(height))
#> Error:
#> ! is.character(height) is not TRUE
```

The error message is not that helpful if the user doesn’t know what
[`is.character()`](https://rdrr.io/r/base/character.html) tests for.

In a function it behaves as follows:

``` r

my_fun <- function(x) stopifnot(is.character(x))
my_fun(height)
#> Error in `my_fun()`:
#> ! is.character(x) is not TRUE
```

### assertthat

The [`assertthat`](https://github.com/hadley/assertthat) package offers
[`assert_that()`](https://rdrr.io/pkg/assertthat/man/assert_that.html).

``` r

library(assertthat)
assert_that(is.character(height))
#> Error:
#> ! height is not a character vector
```

The error message is a big improvement on
[`stopifnot()`](https://rdrr.io/r/base/stopifnot.html)’s.

In a function it behaves as follows:

``` r

my_fun <- function(x) assert_that(is.character(x))
my_fun(dplyr::starwars$height)
#> Error:
#> ! x is not a character vector
```

Perhaps the neatest feature is the ability to set your own error message
for an assertion function using
[`on_failure()`](https://rdrr.io/pkg/assertthat/man/on_failure.html).

``` r

is.character2 <- function(x) is.character(x)
on_failure(is.character2) <- function(call, env) {
  paste0(deparse(call$x), " must be a character - sort it out!")
}
assert_that(is.character2(height))
#> Error:
#> ! height must be a character - sort it out!
```

### checkmate

The [`checkmate`](https://github.com/mllg/checkmate) package provides a
plethora of functions to check the type and related properties of common
objects.

``` r

library(checkmate)
assert_character(height)
#> Error:
#> ! Assertion on 'height' failed: Must be of type 'character', not 'integer'.
```

In a function it behaves as follows

``` r

my_fun <- function(x) assert_character(x)
my_fun(height)
#> Error in `my_fun()`:
#> ! Assertion on 'x' failed: Must be of type 'character', not 'integer'.
```

In addition, the
[`assert()`](https://mllg.github.io/checkmate/reference/assert.html)
function allows multiple alternative `check**` functions (those which
return a string of the error message on failure and a `TRUE` on success)
to be combined into one assertion.

``` r

assert(checkCharacter(height), checkFactor(height))
#> Error:
#> ! Assertion failed. One of the following must apply:
#>  * checkCharacter(height): Must be of type 'character', not 'integer'
#>  * checkFactor(height): Must be of type 'factor', not 'integer'
```

### checkr

The [`checkr`](https://github.com/poissonconsulting/checkr) package
provides a set of expressive functions to test the values of objects.

``` r

library(checkr)
check_vector(height, "")
#> Warning: `check_vector()` was deprecated in checkr 0.5.1.
#> ℹ Please use chk::chk_vector(), chk::check_dim(), chk::chk_unique(),
#>   chk::chk_sorted(), chk::chk_named(), and/or chk::check_values() instead.
#> This warning is displayed once per session.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
#> Error:
#> ! height must be class character
```

In a function it behaves as follows:

``` r

my_fun <- function(x) check_vector(x, "")
my_fun(height)
#> Error:
#> ! x must be class character
```

And multiple alternative checks can be combined using the
[`checkor()`](https://poissonconsulting.github.io/checkr/reference/checkor.md)
function.

``` r

checkor(check_vector(height, ""), check_vector(height, 1))
#> Warning: `checkor()` was deprecated in checkr 0.5.1.
#> ℹ Please use `chk::chkor()` instead.
#> This warning is displayed once per session.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
#> Error:
#> ! height must be class character OR height must be class numeric
```

## Package Comparison

### Return Values

If all checks are passed
[`stopifnot()`](https://rdrr.io/r/base/stopifnot.html) returns an
invisible `NULL`, while
[`assert_that()`](https://rdrr.io/pkg/assertthat/man/assert_that.html)
returns `TRUE`. In contrast, `checkmate::assert_**` and
`checkr::check_**` return a copy of the original object which allows
them to be used in pipes.

### Custom Error Messages

Although there is no way to customize the error message produced by
[`stopifnot()`](https://rdrr.io/r/base/stopifnot.html),
[`assert_that()`](https://rdrr.io/pkg/assertthat/man/assert_that.html)
allows the programmer to specify the message for a individual test using
the `msg` argument. In the case of `checkmate` and `checkr` the
programmer can specify the variable name using the `.var.name` and
`x_name` argument, respectively. This can be very helpful in functions.

``` r

my_fun <- function(x) check_vector(x, "", x_name = substitute(x))
my_fun(height)
#> Error:
#> ! height must be class character
```

### Speed

Much of the `checkmate` package is written in `C` to minimize execution
time.

### Dependencies

Whereas the `checkmate` package depends on `backports` and `utils`, and
`assertthat` depends on `tools`, and `checkr` depends on `err` only
`base` is dependency-free.
