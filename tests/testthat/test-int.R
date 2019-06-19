context("check-int")

test_that("check_int errors", {
  y <- 2L
  expect_identical(check_int(y), y)
  y <- 2
  expect_error(check_int(y), "y must be class integer")
  y <- 1:2
  expect_error(check_int(y), "y must have 1 element")
  y <- NA_integer_
  expect_error(check_int(y), "y must not include missing values")
})

test_that("check_pos_int", {
  expect_identical(check_pos_int(1L, error = FALSE), 1L)
  expect_error(check_pos_int(0, error = TRUE))
  expect_error(check_pos_int(1:2, error = TRUE))
})

test_that("check_neg_int", {
  expect_identical(check_neg_int(-1L, error = FALSE), -1L)
  expect_error(check_neg_int(0, error = TRUE))
  expect_error(check_neg_int(-1:-2, error = TRUE))
})