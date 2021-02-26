test_that("check_character", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  expect_error(check_character(1), "1 must be class character")
  expect_identical(check_character("a"), "a")
  
  y <- factor(c("a", "b", "c"), levels = c("a", "b", "c"))
  expect_identical(check_character(y, coerce = TRUE), c("a", "b", "c"))
})
