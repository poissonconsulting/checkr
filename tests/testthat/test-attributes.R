context("attributes")

test_that("check_attributes", {
  x <- 1
  attributes(x) <- list(y = 2L)
  expect_error(check_attributes(x, values = list(y = 3:4)),
               "the values in element y of attributes of x must lie between '3' and '4'")
})

test_that("check_no_attributes", {
  x <- 1
  expect_identical(check_no_attributes(x), x)
  attributes(x) <- list(y = 2L)
  expect_error(check_no_attributes(x),
               "x must not have attributes")
})
  