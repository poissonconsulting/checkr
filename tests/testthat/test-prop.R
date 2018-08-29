context("check-prop")

test_that("check_prop errors", {
  y <- 1.0
  expect_identical(check_prop(y), y)
  y <- 1L
  expect_error(check_prop(y), "y must be class numeric")
  y <- c(1.0, 1.0)
  expect_error(check_prop(y), "y must have 1 element")
  y <- NA_real_
  expect_error(check_prop(y), "y must not include missing values")
  y <- 2
  expect_error(check_prop(y), "the values in y must lie between '0' and '1'")
})
