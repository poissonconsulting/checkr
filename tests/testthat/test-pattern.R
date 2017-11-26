context("check-pattern")

test_that("pattern", {
  expect_identical(check_pattern("b ", "b"), "b ")
  expect_error(check_pattern("b ", "b$"), "all elements of b  must match regular expression 'b[$]'")
  expect_identical(check_pattern(NULL, "b"), NULL)
  expect_identical(check_pattern(character(0), "b"), character(0))
  expect_identical(check_pattern(integer(0), "b"), integer(0))
  expect_error(check_pattern(1, "b"), "all elements of 1 must match regular expression 'b'")
  expect_identical(check_pattern(1, "1"), 1)
})
