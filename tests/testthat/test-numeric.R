test_that("check_numeric errors", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  expect_identical(check_numeric(1.1, error = FALSE), 1.1)
  expect_error(check_numeric("a", error = TRUE), "a must be class numeric")
  expect_error(check_numeric(1L, error = TRUE), "1L must be class numeric")
  
  y <- 1L
  attr(y, "attr") <- "attr"
  expect_identical(check_numeric(y, coerce = TRUE), 1.0)
})



