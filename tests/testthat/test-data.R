test_that("check_data factor", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
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
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  x <- data.frame(factor = ordered(1:3))
  expect_identical(check_data(x, values = list(factor = ordered(1:3))), x)
  expect_identical(check_data(x, values = list(factor = factor(1:3))), x)
  x <- data.frame(factor = factor(1:3))
  expect_error(check_data(x, values = list(factor = ordered(1:3))), 
               "column factor of x must be class ordered")
  x <- data.frame(factor = ordered(1:3))
  expect_identical(check_data(x, values = list(factor = ordered(1:4))), x)
})

test_that("check_data ordered", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  x <- data.frame(factor = ordered(1:3))
  expect_error(check_data(x, values = list(factor = ordered(c(1,3)))), 
               "level sets of factors are different")
  expect_identical(check_data(x, values = list(factor = ordered(c(1,3), 1:3))), x) 
  expect_error(check_data(x, values = list(factor = ordered(c(1,2), 1:3))), "the values in column factor of x must lie between '1' and '2'") 
  expect_identical(check_data(x, values = list(factor = ordered(c(3, 1,2), 1:3))), x) 
})
