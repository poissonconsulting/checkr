test_that("check_unused errors", {
  fun <- function(...) check_unused(...)
  expect_null(fun())
  expect_error(fun(1), "... must be unused")
})
