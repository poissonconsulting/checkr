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
  
  y <- 1.0
  attr(y, "attr") <- "attr"
  expect_identical(check_int(y, coerce = TRUE), 1L)
})

test_that("check_pos_int", {
  expect_identical(check_pos_int(1L, error = FALSE), 1L)
  expect_error(check_pos_int(0, error = TRUE), "0 must be class integer")
  expect_error(check_pos_int(1:2, error = TRUE), "1:2 must have 1 element")
  
  y <- 1.0
  attr(y, "attr") <- "attr"
  expect_identical(check_pos_int(y, coerce = TRUE), 1L)
})

test_that("check_neg_int", {
  expect_identical(check_neg_int(-1L, error = FALSE), -1L)
  expect_error(check_neg_int(0, error = TRUE), "0 must be class integer")
  expect_error(check_neg_int(-1:-2, error = TRUE), "-1:-2 must have 1 element")
  
  y <- -1.0
  attr(y, "attr") <- "attr"
  expect_identical(check_neg_int(y, coerce = TRUE), -1L)
})

test_that("check_integer", {
  expect_identical(check_integer(1L, error = FALSE), 1L)
  expect_identical(check_integer(-1L, error = FALSE), -1L)
  expect_error(check_integer(0.5, error = TRUE), "0.5 must be class integer")
  expect_identical(check_integer(1:2, error = TRUE), 1:2)
  
  y <- 1.0
  attr(y, "attr") <- "attr"
  expect_identical(check_integer(y, coerce = TRUE), 1L)
})

