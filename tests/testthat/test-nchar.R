context("nchar")

test_that("nchar", {
  expect_identical(check_nchar(1), 1)
  expect_identical(check_nchar(1, 1), 1)
  expect_error(check_nchar(1, 2), "1 must have 2 characters")
  expect_error(check_nchar(1, FALSE), "1 must have 0 characters")
  y <- c("o", "22")
  expect_error(check_nchar(y, c(1,1)), "y must not have more than 1 character")
})
