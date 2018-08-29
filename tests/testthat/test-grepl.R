context("grepl")

test_that("grepl", {
  expect_identical(check_grepl(1), 1)
  expect_identical(check_grepl(1, "^1$"), 1)
  expect_identical(check_grepl(list()), list())
  expect_identical(check_grepl(data.frame()), data.frame())
  expect_identical(check_grepl(c("1", "2")), c("1", "2"))

  expect_error(check_grepl("1", "2"), "1 must match regular expression '2'")
  expect_error(check_grepl(c("1", "2"), "2"), "c[(]\"1\", \"2\"[)] must match regular expression '2'")
})
