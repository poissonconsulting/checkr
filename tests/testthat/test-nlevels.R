test_that("check_nlevels", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_identical(check_nlevels(factor(1)), factor(1))
  expect_error(check_nlevels(factor(1), nlevels = c(2,3)), "factor[(]1[)] must have at least 2 levels")
  expect_error(check_nlevels(NULL), "NULL must have at least 1 level")
  expect_error(check_nlevels(1), "1 must have at least 1 level")
})
