context("utils")

test_that("is_range", {
  expect_true(is_count_range(c(1,2)))
  expect_true(is_count_range(c(2,1)))
  expect_true(is_count_range(c(0,1)))
  expect_true(is_count_range(c(0,0)))
  expect_true(is_count_range(0))
  expect_true(is_count_range(0L))
  
  expect_false(is_count_range(c(0,1,1)))
  expect_false(is_count_range(integer(0)))
  expect_false(is_count_range(c(NA, 1)))
  expect_false(is_count_range(-1))
  expect_false(is_count_range(1.1))
})

test_that("is.POSIXt", {
  expect_true(is.POSIXt(Sys.time()))
})

test_that("check_class_internal", {
  expect_identical(check_class_internal(TRUE, NA), TRUE)
  expect_identical(check_class_internal(TRUE, c(TRUE, FALSE)), TRUE)
  date <- as.Date("2000-01-01")
  expect_identical(check_class_internal(date, date), date)
  expect_identical(check_class_internal(factor(1), factor(2)), factor(1))
  expect_identical(check_class_internal(ordered(1), ordered(2)), ordered(1))
  time <- Sys.time()
  expect_identical(check_class_internal(time, time), time)
})



