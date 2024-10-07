test_that("check_number errors", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  y <- 1.0
  expect_identical(check_number(y), y)
  y <- 1L
  expect_error(check_number(y), "y must be class numeric")
  y <- c(1.0, 1.0)
  expect_error(check_number(y), "y must have 1 element")
  y <- NA_real_
  expect_error(check_number(y), "y must not include missing values")
})
