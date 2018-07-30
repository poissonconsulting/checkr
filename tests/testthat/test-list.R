context("list")

test_that("list", {
  x <- list(x = 1, 2)
  expect_identical(check_list(x), x)
  expect_identical(check_list(x, values = "x"), x)
  expect_identical(check_list(x, values = list(x = 1)), x)
  
})
