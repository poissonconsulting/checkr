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
  expect_error(check_nrow(x, nrow = -1), "nrow must be one or two counts")
  expect_error(check_nrow(x, nrow = 1.5), "nrow must be one or two counts")
})

test_that("check_nrow checks nrow", {
  x <- data.frame(y = 2)
  expect_identical(check_nrow(x), x)
  expect_error(check_nrow(x, nrow = 2), "x must have 2 rows")
  expect_error(check_nrow(x, nrow = c(2,3)), "x must have at least 2 rows")
  expect_error(check_nrow(x, nrow = 0), "x must have 0 rows")
  x <- x[FALSE,,drop = FALSE]
  expect_identical(check_nrow(x, nrow = 0), x)
  expect_error(check_nrow(x), "x must have at least 1 row")
})
