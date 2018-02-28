context("regex")

test_that("regex", {
  expect_identical(check_regex(1), 1)
  expect_identical(check_regex(1, "^1$"), 1)
  expect_identical(check_regex(list()), list())
  expect_identical(check_regex(data.frame()), data.frame())
  expect_identical(check_regex(c("1", "2")), c("1", "2"))

  expect_error(check_regex("1", "2"), "1 must match regular expression '2'")
  expect_error(check_regex(c("1", "2"), "2"), "c[(]\"1\", \"2\"[)] must match regular expression '2'")
})
