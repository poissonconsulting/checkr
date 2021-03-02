test_that("colnames", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  data <- data.frame(x = 1, y = 2, z = 0)
  expect_identical(check_colnames(data, c("y", "x")), data)
  
  expect_error(check_colnames(data, c("y", "x"), exclusive = TRUE),
               "data column names must include and only include 'y' and 'x'")
  expect_error(check_colnames(data, c("y", "x"),
                              order = TRUE),
               "data column names must include 'y' and 'x' in that order") 
  expect_error(check_colnames(data, c("a")),
               "data column names must include 'a'")
  
  expect_identical(check_colnames(data), data)
  expect_error(check_colnames(data, exclusive = TRUE),
               "data must not have any columns")
  
  data <- data.frame()
  expect_identical(check_colnames(data), data)
  expect_identical(check_colnames(data, exclusive = TRUE), data)
  
  data <- data.frame(1, 2, 3)
  names(data) <- NULL
  expect_error(check_colnames(data), "data must have column names")
})
