# Deparse

`chk_deparse` is a wrapper on
[`deparse()`](https://rdrr.io/r/base/deparse.html) that sets a missing
value to be "NA"

## Usage

``` r
chk_deparse(x)
```

## Arguments

- x:

  A substituted object to deparse

## Value

A string

## See also

[`deparse()`](https://rdrr.io/r/base/deparse.html)

## Examples

``` r
chk_deparse(1^2)
#> [1] "1"
```
