test_that("name", {
  
  vec <- c("x", "x.y")
  expect_identical(check_name(vec), vec)
  
  vec <- c("x", "x y")
  expect_error(check_name(vec), "the following 1 value of vec is invalid: 'x y'")
})
