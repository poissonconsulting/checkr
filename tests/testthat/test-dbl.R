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
