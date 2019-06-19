context("missing")

test_that("missing", {
  data <- data.frame(x = 1, y = 2, z = 0)
  expect_identical(check_missing_colnames(data, "a"), data)
  expect_error(check_missing_colnames(data, c("y", "x", "a")), "data must not have columns 'x' and 'y'")
})
  
test_that("missing names", {
  vec <- c(x = 1, y = 2, z = 0)
  expect_error(check_missing_names(vec, c("x", "y", "a"), error = TRUE))
  expect_identical(check_missing_names(vec, "a", error = TRUE), vec)
})
