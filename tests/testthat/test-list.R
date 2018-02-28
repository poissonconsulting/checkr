context("list")

test_that("list", {
  x <- list(x = 1, 2)
  expect_identical(check_list(x), x)
  expect_identical(check_list(x, named = TRUE), x)
  expect_error(check_list(x, named = FALSE), "x must be unnamed")
  expect_identical(check_list(x, named = ".*"), x)
  expect_error(check_list(x, named = ".+"), "names of x must match regular expression")
  expect_error(check_list(x, named = 1), "names of x must have 1 character")
})
