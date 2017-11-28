context("utils")

test_that("punctuate", {
  expect_identical(punctuate(1), "1")
  expect_identical(punctuate(1:2), "1 or 2")
  expect_identical(punctuate(1:3), "1, 2 or 3")
  expect_identical(punctuate(1:3, "and"), "1, 2 and 3")
})

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




