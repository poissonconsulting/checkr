context("utils")

test_that("punctuate", {
  expect_identical(punctuate(1), "1")
  expect_identical(punctuate(1:2), "1 or 2")
  expect_identical(punctuate(1:3), "1, 2 or 3")
  expect_identical(punctuate(1:3, "and"), "1, 2 and 3")
})
