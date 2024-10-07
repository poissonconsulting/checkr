test_that("check_count errors", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  y <- 2L
  expect_identical(check_count(y), y)
  y <- 2
  expect_error(check_count(y), "y must be class integer")
  y <- 1:2
  expect_error(check_count(y), "y must have 1 element")
  y <- NULL
  expect_error(check_count(y), "y must be an atomic vector")
  expect_error(check_count(-1L), "the values in -1L must lie between 0 and 2147483647")
})

test_that("check_count coercion", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_error(check_count(1), "1 must be class integer")
  expect_identical(check_count(1, coerce = TRUE), 1L)
  expect_error(check_count(c(1,1), coerce = TRUE), "c[(]1, 1[)] must have 1 element")
  expect_error(check_count(1.01, coerce = TRUE), "1.01 must be class integer")
  expect_identical(check_count(1.000000000000000000000001, coerce = TRUE), 1L)
})

