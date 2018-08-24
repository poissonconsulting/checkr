context("vector")

test_that("vector", {
  expect_error(check_vector(2, named  = TRUE), "2 must be named")
  x <- 1
  names(x) <- "y"
  expect_identical(check_vector(x, named = TRUE), x)
  
  vec <- c(y = 1, y = 2)
  expect_error(check_vector(vec, named = "x"), "names of vec must match regular expression 'x'")
  
  vec <- c(y = 1, y = 2)
  expect_error(check_vector(vec, named = 2), "names of vec must have 2 characters")
  expect_error(check_vector(vec, named = FALSE), "vec must be unnamed")
  
  vec <- 2
  expect_error(check_vector(vec, c(1,3), only = TRUE), "vec can only include values '1' or '3'")
  expect_identical(check_vector(vec, c(1,3)), vec)
})
