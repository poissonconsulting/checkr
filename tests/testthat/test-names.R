test_that("names", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  vec <- c(x = 1, y = 2, z = 0)
  expect_identical(check_names(vec, c("y", "x")), vec)
  
  expect_error(check_names(vec, c("y", "x"), exclusive = TRUE), "vec names must not include 'z'")
  expect_error(check_names(vec, c("y", "x"), order = TRUE), "vec names must include 'y' and 'x' in that order") 
  expect_error(check_names(vec, c("a")), "vec names must include 'a'")
  
  expect_identical(check_names(vec), vec)
  expect_error(check_names(vec, exclusive = TRUE), "vec must not have any elements")
  
  vec <- c(vec, z = 1)

  expect_identical(check_names(vec), vec)
  expect_identical(check_names(vec, c("x", "y", "z", "z"), order = TRUE, exclusive = TRUE), vec)
  expect_error(check_names(vec, c("x", "y", "z", "z"), unique = TRUE), "names must be unique")
  
  expect_error(check_names(vec, unique = TRUE), "names of vec must be unique")
  
  vec <- numeric(0)
  names(vec) <- character(0)
  expect_identical(check_names(vec), vec)
  expect_identical(check_names(vec, exclusive = TRUE), vec)
  expect_identical(check_names(vec, exclusive = TRUE, unique = TRUE), vec)
})
