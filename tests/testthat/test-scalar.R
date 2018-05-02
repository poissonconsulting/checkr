context("scalar")

test_that("scalar", {
  expect_error(check_scalar(2, named  = TRUE), "2 must be named")
  x <- 1
  names(x) <- "y"
  expect_identical(check_scalar(x, named = TRUE), x)
  
  expect_error(check_scalar(c(1,2)), "c[(]1, 2[)] must have 1 element")
})
