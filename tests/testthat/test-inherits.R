context("inherits")

test_that("check_inherits", {
  x <- list()
  class(x) <- c("a", "b")
  
  expect_identical(check_inherits(x, "a"), x)
  expect_identical(check_inherits(x, "b"), x)
  expect_error(check_inherits(x, "c"), "x must inherit from class c")
  expect_identical(check_inherits(1, "numeric"), 1)
})
