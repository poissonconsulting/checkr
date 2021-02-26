test_that("check_unused errors", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  fun <- function(...) check_unused(...)
  expect_null(fun())
  expect_error(fun(1), "... must be unused")
})
