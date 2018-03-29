context("data")

test_that("check_data factor", {
  expect_identical(check_data(datasets::mtcars), mtcars)
  x <- data.frame(factor = factor(1:3))
  expect_identical(check_data(x, values = list(factor = factor(1:3))), x)
  expect_error(check_data(x, values = list(factor = "")), 
               "column factor of x must be class character")
  x <- data.frame(factor = as.character(1:3), stringsAsFactors = FALSE)
  expect_error(check_data(x, values = list(factor = factor(1:3))), 
               "column factor of x must be class factor")
})

test_that("check_data ordered", {
  x <- data.frame(factor = ordered(1:3))
  expect_identical(check_data(x, values = list(factor = factor(1:3))), x)
  x <- data.frame(factor = factor(1:3))
  expect_error(check_data(x, values = list(factor = ordered(1:3))), 
               "column factor of x must be class ordered")
})
