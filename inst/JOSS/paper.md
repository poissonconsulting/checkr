---
title: "checkr: An R package to check object values"
authors:
- name: Joe Thorley
  orcid: 0000-0002-7683-4592
  affiliation: 1
output:
  html_document:
    keep_md: yes
tags:
- R
affiliations:
  index: 1
  name: Poisson Consulting, Nelson, British Columbia
date: "2018-01-29"
---



## Introduction

`checkr` is a lightweight R package to check the dimensions, classes, values, and names of scalars, vectors, lists and data frames.
The various functions provide informative errors (or warnings) that allow users to quickly identify and fix any problems.

## Demonstration

The following code demonstrates its use

```r
library(checkr)

# the starwars data frame in the dplyr package fails many of these checks
check_data(dplyr::starwars, values = list(
  height = c(66L, 264L),
  name = "",
  mass = c(20,1358, NA),
  hair_color = c("blond", "brown", "black", NA),
  gender = c("male", "female", "hermaphrodite", "none", NA)), 
    order = TRUE, nrow = c(81, 84), key = "hair_color", error = FALSE)
```

```
## Warning: dplyr::starwars column names must include 'height', 'name',
## 'mass', 'hair_color' and 'gender' in that order
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

```
## Warning: dplyr::starwars must not have more than 84 rows
```

```
## Warning: column 'hair_color' in dplyr::starwars must be a unique key
```

The two other main functions are `check_vector()` and `check_list()`.


```r
y <- c(2,1,0,1,NA)
check_vector(y, values = 1:10, length = 2, unique = TRUE, sorted = TRUE, named = TRUE, error = FALSE)
```

```
## Warning: y must be class integer
```

```
## Warning: y must not include missing values
```

```
## Warning: y has unpermitted values 0
```

```
## Warning: y must have 2 elements
```

```
## Warning: y must be unique
```

```
## Warning: y must be sorted
```

```
## Warning: y must be named
```
