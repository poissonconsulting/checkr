test_that("unnamed", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  expect_identical(check_unnamed(2), 2)
  x <- 1
  names(x) <- "y"
  expect_error(check_unnamed(x), "x must be unnamed")
})
