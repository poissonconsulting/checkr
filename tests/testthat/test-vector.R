test_that("vector", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_error(check_vector(2, named  = TRUE), "2 must be named")
  x <- 1
  names(x) <- "y"
  expect_identical(check_vector(x, named = TRUE), x)
  
  expect_error(check_vector(x, named = TRUE, attributes = FALSE), "names are attributes")
  
  expect_error(check_vector(x, attributes = FALSE), "x must not have attributes")
  vec <- 2
  expect_error(check_vector(vec, c(1,3), only = TRUE), "vec can only include values 1 or 3")
  expect_identical(check_vector(vec, c(1,3)), vec)
  vec <- "2"
  expect_error(check_vector(vec, c("1","3"), only = TRUE), "vec can only include values '1' or '3'")
})

test_that("vector two classes", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  value <- 1
  class(value) <- c("class2", "class1")
  
  x <- 1
  class(x) <- "class1"
  
  expect_error(check_vector(x, values = value), "x must be class class2")
  
  class(x) <- c("class2", "class1")
  expect_identical(check_vector(x, values = value), x)
  
  class(x) <- c("class1", "class2")
  expect_error(check_vector(x, values = value), 
                   "x must inherit from classes 'class2' and 'class1' in that order")
})

test_that("vector with units", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  value <- units::as_units(1, "m")

  x <- 1

  expect_error(check_vector(x, values = value), "x must be class units")
  
  x <- units::as_units(3, "m")
 
  expect_identical(check_vector(x, values = value), x)
  
  x <- units::as_units(3, "s")
 
  expect_error(check_vector(x, values = value), "x must have units 'm' not 's'")
  x <- units::as_units(3, "m")
  expect_identical(check_vector(x, values = value), x)
})
