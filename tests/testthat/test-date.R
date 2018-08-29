context("check-day")

test_that("check_day errors", {
  y <- as.Date("2002-01-02")
  expect_identical(check_day(y), y)
  y <- c(y,y)
  expect_error(check_day(y), "y must have 1 element")
  y <- 2
  expect_error(check_day(y), "y must be class Date")
  y <- NULL
  expect_error(check_day(y), "y must have 1 element")
})

test_that("check_day coercion", {
  time <- as.POSIXct("2001-02-03 23:59:59", tz = "PST8PDT")
  expect_error(check_day(time), "time must be class Date")
  expect_identical(check_day(time, coerce = TRUE), as.Date("2001-02-03"))
  expect_error(check_day(1.01, coerce = TRUE), "1.01 must be class Date")
})
