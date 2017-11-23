context("check-string")

test_that("check_string errors", {
  y <- "oeu"
  expect_identical(check_string(y), y)
  y <- 2
  expect_error(check_string(y), "y must be class character")
  y <- c(TRUE, TRUE)
  expect_error(check_string(y), "y must be class character")
  y <- character(0)
  expect_error(check_string(y), "y must be length 1")})
