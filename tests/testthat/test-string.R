test_that("check_string errors", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  y <- "oeu"
  expect_identical(check_string(y), y)
  y <- 2
  expect_error(check_string(y), "y must be class character")
  y <- c(TRUE, TRUE)
  expect_error(check_string(y), "y must have 1 element")
  y <- character(0)
  expect_error(check_string(y), "y must have 1 element")
  
  y <- as.factor("1")
  attr(y, "new") <- "new" 
  expect_error(check_string(y), "y must be class character")
  expect_identical(check_string(y, coerce = TRUE), "1")
})


test_that("check_string coerce", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  expect_error(check_string(factor('1')), 'factor[(]"1"[)] must be class character')
  expect_identical(check_string(factor('1'), coerce = TRUE), "1")
  expect_error(check_string(factor(c('1', '1')), coerce = TRUE), 'factor[(]c[(]"1", "1"[)][)] must have 1 element')
})
