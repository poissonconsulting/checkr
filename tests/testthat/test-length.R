context("length")

test_that("length", {
  
  expect_identical(check_length(2), 2)
  expect_identical(check_length(character(0), min_length = 0), character(0))
  expect_error(check_length(NULL), "NULL must be at least of length 1")
  expect_error(check_length(list()), "list[(][)] must be at least of length 1")
  expect_error(check_length(1:2, max_length = 1), "1:2 must be length 1")
  expect_error(check_length(1:3, max_length = 2), "1:3 must not be longer than 2")
})
