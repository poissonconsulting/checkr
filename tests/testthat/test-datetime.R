context("check-datetime")

test_that("check_datetime errors", {
  y <- as.POSIXct("2001-02-03 23:59:59", tz = "PST8PDT")
  expect_identical(check_datetime(y), y)
  y <- c(y,y)
  expect_error(check_datetime(y), "y must have 1 element")
  y <- 2
  expect_error(check_datetime(y), "y must be class POSIXct")

  y <- as.Date("2002-01-02")
  expect_error(check_datetime(y), "y must be class POSIXct")
  y <- NULL
  expect_error(check_datetime(y), "y must be class POSIXct")
})
