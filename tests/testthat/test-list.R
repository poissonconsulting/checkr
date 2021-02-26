test_that("list", {
  x <- list(x = 1, 2)
  expect_identical(check_list(x), x)
  expect_identical(check_list(x, values = "x"), x)
  expect_identical(check_list(x, values = list(x = 1)), x)
  
  x <- c(1, 2)
  expect_error(check_list(x), "x must be a list")
})

test_that("check_list produces warnings", {
  x <- list(x = 1, 2)
  lifecycle::expect_deprecated(check_list(x, named = TRUE))
  lifecycle::expect_deprecated(check_list(x, unique = TRUE))
  lifecycle::expect_deprecated(check_list(x, length = 2))
})
