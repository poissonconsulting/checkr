context("function")

test_that("function", {
  expect_error(check_environment(1), "1 must be an environment")
  expect_identical(check_environment(.GlobalEnv), .GlobalEnv)
})
