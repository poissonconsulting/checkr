context("new_duplicated")

test_that("new_duplicated works", {
  data <- tibble::tibble(a = c(1, 1, 4, 4),
                         b = c(2, 2, 5, 5),
                         c = c(3, 3, 6, 6))
  
  expect_identical(new_duplicated(data),
                   c(FALSE, TRUE, FALSE, TRUE))
  expect_identical(new_duplicated(data, incomparables = 1),
                   c(FALSE, FALSE, FALSE, TRUE))
  expect_identical(new_duplicated(data, fromLast = TRUE),
                   c(TRUE, FALSE, TRUE, FALSE))
})
