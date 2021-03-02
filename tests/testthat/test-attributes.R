test_that("check_attributes", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  x <- 1
  attributes(x) <- list(y = 2L)
  expect_error(check_attributes(x, values = list(y = 3:4)),
               "the values in element y of attributes of x must lie between 3 and 4")
  y <- 1
  expect_error(check_attributes(y), "y must have attributes")
  names(y) <- "z"
  expect_identical(check_attributes(y), y)
  expect_error(check_attributes(y, names = FALSE), "y must have attributes")
  class(y) <- c("sn", "numeric")
  expect_identical(check_attributes(y, names = FALSE), y)
  expect_identical(check_attributes(y, class = FALSE), y)
  expect_error(check_attributes(y, class = FALSE, names = FALSE), "y must have attributes")
  
})

test_that("check_no_attributes", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  x <- 1
  expect_identical(check_no_attributes(x), x)
  attributes(x) <- list(y = 2L)
  expect_error(check_no_attributes(x),
               "x must not have attributes")
  y <- 1
  expect_identical(check_no_attributes(y), y)
  names(y) <- "z"
  expect_error(check_no_attributes(y), "y must not have attributes")
  expect_identical(check_no_attributes(y, names = FALSE), y)
  class(y) <- c("sn", "numeric")
  expect_error(check_no_attributes(y, names = FALSE), "y must not have attributes")
  expect_error(check_no_attributes(y, class = FALSE), "y must not have attributes")
  expect_identical(check_no_attributes(y, class = FALSE, names = FALSE), y)
})
