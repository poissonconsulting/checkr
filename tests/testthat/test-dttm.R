test_that("check_datetime errors", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  y <- as.POSIXct("2001-02-03 23:59:59", tz = "UTC")
  expect_identical(check_dttm(y), y)
  expect_error(check_dttm(y, tzone = "PST8PDT"),  
               "x time zone must be 'PST8PDT' [(]not 'UTC'[)]")
  y2 <- as.POSIXct("2001-02-03", tz = "UTC")
  expect_identical(check_dttm(as.Date(y2, tz = "UTC"), coerce = TRUE), y2)

  y <- as.POSIXct("2001-02-03 23:59:59", tz = "PST8PDT")
  y <- c(y,y)
  expect_error(check_datetime(y), "y must have 1 element")
  y <- 2
  expect_error(check_datetime(y), "y must be class POSIXct")

  y <- as.Date("2002-01-02")
  expect_error(check_datetime(y), "y must be class POSIXct")
  y <- NULL
  expect_error(check_datetime(y), "y must have 1 element")
})
