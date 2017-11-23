context("named")

test_that("named", {
  
  expect_error(check_named(2), "2 must be named")
  x <- 1
  names(x) <- "y"
  expect_identical(check_named(x), x)
})

test_that("unnamed", {
  expect_identical(check_unnamed(2), 2)
  x <- 1
  names(x) <- "y"
  expect_error(check_unnamed(x), "x must be unnamed")
})
