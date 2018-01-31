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
date: "2018-01-30"
output: 
  html_document: 
    keep_md: yes
---



## Summary

Assertive programming follows the principles of fail fast and fail visibly [@shore_fail_2004].
It is implemented by issuing an informative error message if function arguments fail to satisfy specific criteria.
This is particularly important in R because it is dynamically-typed language [@hutchison_evaluating_2012].

`checkr` is a dependency-free, pipe-friendly R package of assertive functions to check the properties of common R objects.
In the case of failure the functions, which are designed to be used in scripts and packages,
issue informative error messages.

The most interesting and unique feature of `checkr` is the use of objects to check 
the values of other objects using an elegant and expressive syntax.

The software archive is at <https://github.com/poissonconsulting/checkr>.

## References
