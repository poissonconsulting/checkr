context("key")

test_that("key", {
  data <- data.frame(x = 1:1, y = 1:2)
  expect_error(check_key(data, "x"), "column 'x' in data must be a unique key")
  expect_identical(check_key(data, c("y", "x")), data)
})

test_that("key with missing values", {
  expect_identical(check_key(data.frame(x = NA)), data.frame(x = NA))
  expect_error(check_key(data.frame(x = c(NA, NA))), 
               "column 'x' in data.frame[(]x = c[(]NA, NA[)][)] must be a unique key")
  expect_identical(check_key(data.frame(x = c(NA, NA)), na_distinct = TRUE),
               data.frame(x = c(NA, NA)))
})
