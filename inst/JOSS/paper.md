---
title: 'checkr: An R package for Assertive Programming'
authors:
- affiliation: 1
  name: Joe Thorley
  orcid: 0000-0002-7683-4592
affiliations:
  index: 1
  name: Poisson Consulting, Nelson, British Columbia
tags: 
  - R
  - programming
  - assertive
bibliography: paper.bib
date: "2018-03-26"
output: 
  html_document: 
    keep_md: yes
---



## Summary

Assertive programming follows the principles of fail fast and fail visibly [@shore_fail_2004].
It is implemented by issuing an informative error message if function arguments fail to satisfy specific criteria.
This is particularly important in R because it is dynamically-typed language [@hutchison_evaluating_2012].

`checkr` is a dependency-free, pipe-friendly R package of assertive functions to check the properties of common R objects.
In the case of failure, the functions, which are designed to be used in scripts and packages, issue informative error messages.

The most interesting and unique feature of `checkr` is the use of objects to check the values of other objects using an elegant and expressive syntax. 
For example the values in the `height`, `name`, `mass`, `hair_color` and `gender` columns in the `starwars` data frame are checked using the syntax.


```r
library(checkr)

check_data(dplyr::starwars, values = list(
  height = c(66L, 264L),
  mass = c(20,1358, NA),
  hair_color = c("blond", "brown", "black", NA)), error = FALSE)
```

```
## Warning: column height of dplyr::starwars must not include missing values
```

```
## Warning: the values in column mass of dplyr::starwars must lie between 20
## and 1358
```

```
## Warning: column hair_color of dplyr::starwars can only include values
## 'black', 'blond' or 'brown'
```

The software archive is at <https://github.com/poissonconsulting/checkr>.

## References
