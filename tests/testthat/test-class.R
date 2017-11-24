context("check-class")

test_that("class", {
  expect_identical(check_class(TRUE, NA), TRUE)
  expect_identical(check_class(TRUE, c(TRUE, FALSE)), TRUE)
  date <- as.Date("2000-01-01")
  expect_identical(check_class(date, date), date)
  expect_identical(check_class(factor(1), factor(2)), factor(1))
  expect_identical(check_class(ordered(1), ordered(2)), ordered(1))
  time <- Sys.time()
  expect_identical(check_class(time, time), time)
})
