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

test_that("missing regex issues warning", {
  expect_warning(check_grepl(1, regex = "^1$"), "argument regex is deprecated; please use pattern instead.")
  
})

test_that("check_pattern errors", {
  string <- "this is a string"
  expect_identical(check_pattern(string, "string"), string)
  expect_error(check_pattern(string, "x"), "all elements of string must match regular expression 'x'")
})

test_that("check_regex errors", {
  string <- "this is a string"
  expect_identical(check_regex(string, "string"), string)
  expect_error(check_regex(string, "x"), "string must match regular expression 'x'")
})
