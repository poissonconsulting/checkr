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

test_that("key with no values", {
  data <- data.frame(SITEID = character(0), DATE = as.Date(integer(0), "2000-01-01"), TIME = hms::as.hms(integer(0)))
  expect_identical(check_key(data, key = c("SITEID", "DATE", "TIME")), data)
})

test_that("key with no values", {
  data <- data.frame(SITEID = "s1", DATE = as.Date(3, "2000-01-01"), TIME = hms::as.hms(10))
  expect_identical(check_key(data, key = c("SITEID", "DATE", "TIME")), data)
})
