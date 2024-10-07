test_that("levels", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_error(check_levels(1, c("y", "x")), "1 must have a levels attribute")
  expect_error(check_levels(factor(1), c("y", "x")), "factor[(]1[)] levels must be identical to 'y' and 'x'")
  expect_identical(check_levels(factor(1), "1"), factor(1))
})

test_that("levels errors for order and exclusive args", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  x <- factor(c("a", "b", "c"), levels = c("a", "b", "c"))
  
  expect_error(check_levels(x, exclusive = FALSE, levels = c("b", "c", "a")),
               "x levels must include 'b', 'c' and 'a' in that order")
  
  expect_error(check_levels(x, order = FALSE, levels = c("b", "c", "a", "d")),
               "x levels must include and only include 'b', 'c', 'a' and 'd'")
  
  expect_error(check_levels(x, levels = c("b", "c", "a")),
               "x levels must be identical to 'b', 'c' and 'a'")
})

