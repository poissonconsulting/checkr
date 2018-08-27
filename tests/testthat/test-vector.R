context("vector")

test_that("vector", {
  expect_error(check_vector(2, named  = TRUE), "2 must be named")
  x <- 1
  names(x) <- "y"
  expect_identical(check_vector(x, named = TRUE), x)
  
  expect_error(check_vector(x, named = TRUE, attributes = FALSE), "names are attributes")
  
  expect_error(check_vector(x, attributes = FALSE), "x must not have attributes")
  vec <- 2
  expect_error(check_vector(vec, c(1,3), only = TRUE), "vec can only include values '1' or '3'")
  expect_identical(check_vector(vec, c(1,3)), vec)
})
