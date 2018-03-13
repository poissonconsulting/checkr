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
  - error checking
  - assertive programming
bibliography: paper.bib
date: "2018-03-12"
output: 
  html_document: 
    keep_md: yes
---

## Summary

The purpose of the `checkr` package is allow R programmers to quickly check that the inputs to their functions are of the correct type and to issue a helpful error message if they are not. 
Such assertive programming facilitates software development, use and debugging by ensuring a problem is quickly and obviously identified [@shore_fail_2004]. 
It is particularly important in R because it is a dynamically typed language [@hutchison_evaluating_2012].

`checkr` is light-weight, pipe-friendly and dependency-free with customizable error messages. 
Objects can be used to define the permitted types and values of other objects using an elegant and expressive syntax and multiple alternative checks can be combined using the `checkor()` function.
The software archive is at <https://github.com/poissonconsulting/checkr>.

The `checkr` R package is used by the `rpdo` [@thorley_rpdo_2018] and `mcmcr` [@thorley_mcmcr_2018] packages.

## References
