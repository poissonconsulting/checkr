context("check-prob")

test_that("check_prob errors", {
  y <- 1.0
  expect_identical(check_prob(y), y)
  y <- 1L
  expect_error(check_prob(y), "y must be class numeric")
  y <- c(1.0, 1.0)
  expect_error(check_prob(y), "y must have 1 element")
  y <- NA_real_
  expect_error(check_prob(y), "y must not include missing values")
  y <- 2
  expect_error(check_prob(y), "the values in y must lie between 0 and 1")
  y <- 1
  attr(y, "attr") <- "attr"
  expect_identical(check_prob(y, coerce = TRUE), 1)
})

test_that("check_props errors", {
  vec <- c(0.5, 0.5)
  expect_identical(check_props(vec), vec)
  vec <- c(1.0, 1.0)
  expect_error(check_props(vec))
})

test_that("check_prop errors", {
  vec <- c(0.5)
  expect_identical(check_prop(vec), vec)
  vec <- c(1.1)
  expect_error(check_prop(vec))
  vec <- c(0.4, 0.5)
  expect_error(check_prop(vec))
})

test_that("check_probability errors", {
  vec <- c(0.5)
  expect_identical(check_probability(vec), vec)
  vec <- c(1.1)
  expect_error(check_probability(vec), "the values in vec must lie between 0 and 1")
  vec <- c(0.5, 0.5)
  expect_error(check_probability(vec), "vec must have 1 element")
})



