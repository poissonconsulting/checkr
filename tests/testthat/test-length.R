context("length")

test_that("length", {
  
  expect_identical(check_length(2), 2)
  expect_identical(check_length(character(0), length = 0), character(0))
  expect_error(check_length(NULL), "NULL must have at least 1 element")
  expect_error(check_length(list()), "list[(][)] must have at least 1 element")
  expect_error(check_length(1:2, length = 1), "1:2 must have 1 element")
  expect_error(check_length(1:3, length = c(1,2)), "1:3 must not have more than 2 elements")
})
