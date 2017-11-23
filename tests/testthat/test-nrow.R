context("check-nrow")

test_that("check_nrow requires a data frame", {
  x <- data.frame(y = 2)
  expect_identical(check_nrow(x), x)
  y <- NULL
  expect_error(check_nrow(y))
})

test_that("check_nrow requires counts", {
  x <- data.frame(y = 2)
  expect_identical(check_nrow(x), x)
  expect_error(check_nrow(x, min_nrow = -1), "min_nrow must be a count")
  expect_error(check_nrow(x, min_nrow = 1.5), "min_nrow must be a count")
  expect_error(check_nrow(x, min_nrow = 2, max_nrow = 1), "max_nrow must not be less than min_nrow")
})

test_that("check_nrow checks nrow", {
  x <- data.frame(y = 2)
  expect_identical(check_nrow(x), x)
  expect_error(check_nrow(x, min_nrow = 2), "x must have at least 2 rows")
  expect_error(check_nrow(x, max_nrow = 0), "max_nrow must not be less than min_nrow")
  expect_error(check_nrow(x, min_nrow = 0, max_nrow = 0), "x must have 0 rows")
  x <- x[FALSE,,drop = FALSE]
  expect_identical(check_nrow(x, min_nrow = 0), x)
  expect_error(check_nrow(x), "x must have at least 1 row")
  expect_error(check_nrow(x, min_nrow = 2), "x must have at least 2 rows")
})
