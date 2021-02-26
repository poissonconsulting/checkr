test_that("class", {
  ordered <- ordered(c("1", "3", "0"))
  factor <- factor(c("1", "3", "0"))
  
  expect_identical(check_vector(ordered, ordered(1)), ordered)
  expect_identical(check_vector(ordered, factor(1)), ordered)
  expect_identical(check_vector(factor, factor(1)), factor)
  expect_error(check_vector(factor, ordered(1)), "factor must be class ordered")
})

test_that("levels", {
  ordered <- ordered(c("1", "3", "0"))
  factor <- factor(c("1", "3", "0"))
  
  expect_identical(check_levels(ordered, c("0", "1", "3")), ordered)
  expect_identical(check_levels(factor, c("0", "1", "3")), factor)
  expect_error(check_levels(ordered, c("0", "1")), 
               "ordered levels must be identical to '0' and '1'")
  expect_error(check_levels(ordered, c("0", "3", "1")), 
               "ordered levels must be identical to '0', '3' and '1'")
})