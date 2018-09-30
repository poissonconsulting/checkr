context("check-props")

test_that("check_props errors", {
  y <- 1.0
  expect_identical(check_props(y), y)
  y <- 1L
  expect_error(check_props(y), "y must be class numeric")
  y <- c(1.0, 1.0)
  expect_error(check_props(y), "values of y must sum to 1 [(]not 2[)]")
  y <- NA_real_
  expect_error(check_props(y), "y must not include missing values")
  y <- 2
  expect_error(check_props(y), "the values in y must lie between 0 and 1")
})
