test_that("check_null", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  expect_null(check_null(NULL))
  expect_error(check_null(1), "^1 must be NULL$")
})
