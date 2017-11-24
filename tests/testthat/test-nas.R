context("check-nas")

test_that("nas", {
  expect_identical(check_nas(NA, NA), NA)
  expect_identical(check_nas(c(TRUE, NA), c(FALSE, NA)), c(TRUE, NA))
  expect_error(check_nas(c(TRUE, NA), NA), "c[(]TRUE, NA[)] must only include missing values")
  expect_error(check_nas(c(TRUE, NA), TRUE), "c[(]TRUE, NA[)] must not include missing values")
  expect_identical(check_nas(NA_character_, NA), NA_character_)
  expect_error(check_nas(NA_character_, 1), "NA must not include missing values")
})
