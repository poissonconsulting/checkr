test_that("check_nrow requires a data frame", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  x <- data.frame(y = 2)
  expect_identical(check_nrow(x), x)
  y <- NULL
  expect_error(check_nrow(y))
})

test_that("check_nrow requires counts", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  x <- data.frame(y = 2)
  expect_identical(check_nrow(x), x)
  expect_error(check_nrow(x, nrow = -1), "nrow must be a flag, a missing value, a count, a count range or a count vector")
  expect_error(check_nrow(x, nrow = 1.5), "nrow must be a flag, a missing value, a count, a count range or a count vector")
})

test_that("check_nrow checks nrow", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  x <- data.frame(y = 2)
  expect_identical(check_nrow(x), x)
  expect_error(check_nrow(x, nrow = 2), "x must have 2 rows")
  expect_error(check_nrow(x, nrow = c(2,3)), "x must have at least 2 rows")
  expect_error(check_nrow(x, nrow = 0), "x must have 0 rows")
  x <- x[FALSE,,drop = FALSE]
  expect_identical(check_nrow(x, nrow = 0), x)
  expect_error(check_nrow(x), "x must have at least 1 row")
})
