test_that("function", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_error(check_environment(1), "1 must be an environment")
  expect_identical(check_environment(.GlobalEnv), .GlobalEnv)
})
