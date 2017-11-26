context("key")

test_that("key", {
  data <- data.frame(x = 1:1, y = 1:2)
  expect_error(check_key(data, "x"), "column 'x' in data must be a unique key")
  expect_identical(check_key(data, c("y", "x")), data)
})