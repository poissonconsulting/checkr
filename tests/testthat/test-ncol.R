test_that("check_ncol requires a data frame", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  x <- data.frame(y = 2)
  expect_identical(check_ncol(x), x)
  y <- NULL
  expect_error(check_ncol(y))
})

test_that("check_ncol requires counts", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  x <- data.frame(y = 2)
  expect_identical(check_ncol(x), x)
  expect_error(check_ncol(x, ncol = -1), "ncol must be a flag, a missing value, a count, a count range or a count vector")
  expect_error(check_ncol(x, ncol = 1.5), "ncol must be a flag, a missing value, a count, a count range or a count vector")
})

test_that("check_ncol checks ncol", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  x <- data.frame(y = 2)
  expect_identical(check_ncol(x), x)
  expect_error(check_ncol(x, ncol = c(2,2)), "x must have at least 2 columns")
  expect_error(check_ncol(x, ncol = 0), "x must have 0 columns")
  x <- data.frame()
  expect_identical(check_ncol(x, ncol = 0), x)
  expect_error(check_ncol(x), "x must have at least 1 column")
})
