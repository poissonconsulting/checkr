context("check-ncol")

test_that("check_ncol requires a data frame", {
  x <- data.frame(y = 2)
  expect_identical(check_ncol(x), x)
  y <- NULL
  expect_error(check_ncol(y))
})

test_that("check_ncol requires counts", {
  x <- data.frame(y = 2)
  expect_identical(check_ncol(x), x)
  expect_error(check_ncol(x, min_ncol = -1), "min_ncol must be a count")
  expect_error(check_ncol(x, min_ncol = 1.5), "min_ncol must be a count")
  expect_error(check_ncol(x, min_ncol = 2, max_ncol = 1), "max_ncol must not be less than min_ncol")
})

test_that("check_ncol checks ncol", {
  x <- data.frame(y = 2)
  expect_identical(check_ncol(x), x)
  expect_error(check_ncol(x, min_ncol = 2), "x must have at least 2 columns")
  expect_error(check_ncol(x, max_ncol = 0), "max_ncol must not be less than min_ncol")
  expect_error(check_ncol(x, min_ncol = 0, max_ncol = 0), "x must have 0 columns")
  x <- data.frame()
  expect_identical(check_ncol(x, min_ncol = 0), x)
  expect_error(check_ncol(x), "x must have at least 1 column")
  expect_error(check_ncol(x, min_ncol = 2), "x must have at least 2 columns")
})
