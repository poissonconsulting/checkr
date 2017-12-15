context("length")

test_that("length1", {
  expect_identical(check_length1(2), 2)
  expect_error(check_length1(character(0)), "character[(]0[)] must have 1 element")
  expect_error(check_length1(NULL), "NULL must have 1 element")
  expect_error(check_length1(list()), "list[(][)] must have 1 element")
  expect_error(check_length1(1:2), "1:2 must have 1 element")
})

test_that("length", {
  
  expect_identical(check_length(2), 2)
  expect_identical(check_length(character(0), length = 0), character(0))
  expect_error(check_length(NULL), "NULL must have at least 1 element")
  expect_error(check_length(list()), "list[(][)] must have at least 1 element")
  expect_error(check_length(1:2, length = 1), "1:2 must have 1 element")
  expect_error(check_length(1:3, length = c(1,2)), "1:3 must not have more than 2 elements")
})
