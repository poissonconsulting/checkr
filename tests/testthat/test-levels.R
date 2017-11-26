context("levels")

test_that("levels", {
  
  expect_error(check_levels(1, c("y", "x")), "1 must have a levels attribute")
  expect_error(check_levels(factor(1), c("y", "x")), "factor[(]1[)] levels must be identical to 'y' and 'x'")
  expect_identical(check_levels(factor(1), "1"), factor(1))
})
