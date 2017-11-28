context("check-flag")

test_that("check_flag errors", {
  y <- TRUE
  expect_identical(check_flag(y), y)
  y <- 2
  expect_error(check_flag(y), "y must be class logical")
  y <- c(TRUE, TRUE)
  expect_error(check_flag(y), "y must have 1 element")
  y <- NA
  expect_error(check_flag(y), "y must not include missing values")
  expect_identical(check_flag(FALSE), FALSE)
})
