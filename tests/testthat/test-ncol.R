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
  expect_error(check_ncol(x, ncol = -1), "ncol must be one or two counts")
  expect_error(check_ncol(x, ncol = 1.5), "ncol must be one or two counts")
})

test_that("check_ncol checks ncol", {
  x <- data.frame(y = 2)
  expect_identical(check_ncol(x), x)
  expect_error(check_ncol(x, ncol = c(2,2)), "x must have at least 2 columns")
  expect_error(check_ncol(x, ncol = 0), "x must have 0 columns")
  x <- data.frame()
  expect_identical(check_ncol(x, ncol = 0), x)
  expect_error(check_ncol(x), "x must have at least 1 column")
})
