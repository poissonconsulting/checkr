test_that("check_intersection", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  x1 <- 1:3
  x2 <- 1:4
  expect_identical(check_intersection(x1, x2), x1)
  expect_error(check_intersection(x1, x2, all_y = TRUE), "x1 must include all the elements in x2")
  expect_error(check_intersection(x2, x1), "x1 must include all the elements in x2")
})
