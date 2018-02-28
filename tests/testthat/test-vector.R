context("vector")

test_that("vector", {
  
  expect_error(check_vector(2, named  = TRUE), "2 must be named")
  x <- 1
  names(x) <- "y"
  expect_identical(check_vector(x, named = TRUE), x)
  
  vec <- c(y = 1, y = 2)
  expect_error(check_vector(vec, named = "x"), "names of vec must match regular expression 'x'")
})
