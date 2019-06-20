context("check-dbl")

test_that("check_dbl errors", {
  y <- 1.0
  expect_identical(check_dbl(y), y)
  y <- 1L
  expect_error(check_dbl(y), "y must be class numeric")
  y <- c(1.0, 1.0)
  expect_error(check_dbl(y), "y must have 1 element")
  y <- NA_real_
  expect_error(check_dbl(y), "y must not include missing values")
  y <- 1.0
  names(y) <- "x"
  expect_error(check_dbl(y), "y must be unnamed")
  expect_identical(check_dbl(y, coerce = TRUE), 1.0)
  expect_true(is.null(names(check_dbl(y, coerce = TRUE))))
  expect_identical(check_dbl(1L, coerce = TRUE), 1.0)
})

test_that("check_double errors", {
  x <- 1.0
  expect_identical(check_double(x), 1.0)
  
  attr(x, "attr") <- "attr"
  expect_error(check_double(x), "x must not have attributes")
  
  x <- "a"
  expect_error(check_double(x), "x must be class numeric")
  
  y <- 1
  attr(y, "attr") <- "attr"
  expect_identical(check_double(y, coerce = TRUE), 1.0)
})


test_that("check_pos_dbl errors", {
  expect_identical(check_pos_dbl(1), 1)
  expect_error(check_pos_dbl(-1), "-1 must be positive")
  
  y <- 1
  attr(y, "attr") <- "attr"
  expect_identical(check_pos_dbl(y, coerce = TRUE), 1.0)
})

test_that("check_neg_dbl errors", {
  expect_identical(check_neg_dbl(-1), -1)
  expect_error(check_neg_dbl(1), "1 must be negative")
  
  y <- -1
  attr(y, "attr") <- "attr"
  expect_identical(check_neg_dbl(y, coerce = TRUE), -1.0)
})

test_that("check_noneg_dbl errors", {
  expect_identical(check_noneg_dbl(1), 1)
  expect_error(check_noneg_dbl(-1), "-1 must be non-negative")
  
  y <- 1
  attr(y, "attr") <- "attr"
  expect_identical(check_noneg_dbl(y, coerce = TRUE), 1.0)
})
