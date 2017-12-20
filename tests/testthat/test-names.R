context("names")

test_that("names", {
  
  vec <- c(x = 1, y = 2, z = 0)
  expect_identical(check_names(vec, c("y", "x")), vec)
  
  expect_error(check_names(vec, c("y", "x"), exclusive = TRUE), "vec names must include and only include 'y' and 'x'")
  expect_error(check_names(vec, c("y", "x"), order = TRUE), "vec names must include 'y' and 'x' in that order") 
  expect_error(check_names(vec, c("a")), "vec names must include 'a'")
  
  expect_identical(check_names(vec), vec)
  expect_error(check_names(vec, exclusive = TRUE), "vec must not have any elements")
  
  vec <- numeric(0)
  names(vec) <- character(0)
  expect_identical(check_names(vec), vec)
  expect_identical(check_names(vec, exclusive = TRUE), vec)
})
