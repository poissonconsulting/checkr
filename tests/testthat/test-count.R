context("check-count")

test_that("check_count errors", {
  y <- 2L
  expect_identical(check_count(y), y)
  y <- 2
  expect_error(check_count(y), "y must be class integer")
  y <- 1:2
  expect_error(check_count(y), "y must be length 1")
  y <- NULL
  expect_error(check_count(y), "y must be class integer")
  expect_error(check_count(-1L), "the values in -1L must lie between 0 and 2147483647")
})
