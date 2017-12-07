context("ordered")

test_that("ordered", {
  
  ordered <- ordered(c("1", "3", "0"))
  factor <- factor(c("1", "3", "0"))
  
  expect_identical(check_vector(ordered, ordered(1)), ordered)
  expect_identical(check_vector(ordered, factor(1)), ordered)
  expect_identical(check_vector(factor, factor(1)), factor)
  expect_error(check_vector(factor, ordered(1)), "factor must be class ordered")
})