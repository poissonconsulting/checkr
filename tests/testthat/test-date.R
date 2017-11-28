context("check-date")

test_that("check_date errors", {
  y <- as.Date("2002-01-02")
  expect_identical(check_date(y), y)
  y <- c(y,y)
  expect_error(check_date(y), "y must have 1 element")
  y <- 2
  expect_error(check_date(y), "y must be class Date")
  y <- NULL
  expect_error(check_date(y), "y must be class Date")
})

test_that("check_date coercion", {
  time <- as.POSIXct("2001-02-03 23:59:59", tz = "PST8PDT")
  expect_error(check_date(time), "time must be class Date")
  expect_identical(check_date(time, coerce = TRUE), as.Date("2001-02-03"))
  expect_error(check_date(1.01, coerce = TRUE), "1.01 must be class Date")
})
