test_that("check_lgl errors", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  y <- TRUE
  expect_identical(check_lgl(y), y)
  y <- 2
  expect_error(check_lgl(y), "y must be class logical")
  y <- c(TRUE, TRUE)
  expect_error(check_lgl(y), "y must have 1 element")
  y <- NA
  expect_error(check_lgl(y), "y must not include missing values")
  expect_identical(check_lgl(FALSE), FALSE)
})

test_that("check_flag errors", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  y <- TRUE
  expect_identical(check_flag(y), y)
  y <- 2
  expect_error(check_flag(y), "y must be class logical")
  y <- c(TRUE, TRUE)
  expect_error(check_flag(y), "y must have 1 element")
  y <- NA
  expect_error(check_flag(y), "y must not include missing values")
  expect_identical(check_flag(FALSE), FALSE)
})

test_that("check_logical errors", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_error(check_logical(1, error = TRUE), "1 must be class logical")
  expect_identical(check_logical(FALSE, error = FALSE), FALSE)
  expect_identical(check_logical(c(FALSE, TRUE), error = FALSE), c(FALSE, TRUE))
})

test_that("check_flag_na errors", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  y <- TRUE
  expect_identical(check_flag_na(y), y)
  y <- 2
  expect_error(check_flag_na(y), "y must be class logical")
  y <- c(TRUE, TRUE)
  expect_error(check_flag_na(y), "y must have 1 element")
  y <- NA
  expect_identical(check_flag_na(y), y)
})
