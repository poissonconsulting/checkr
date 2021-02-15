test_that("checkor", {
  expect_true(checkor(check_null(NULL), check_null(1), error = TRUE))
  expect_error(checkor(check_null(1), check_null(1), error = TRUE), "1 must be NULL")
  expect_error(checkor(check_null(1), check_null(2), error = TRUE), "1 must be NULL OR 2 must be NULL")
})


test_that("checkor works", {
  expect_identical(checkor(), TRUE)
  expect_identical(checkor(x <- 1), TRUE)
  expect_error(checkor(stop()), "^$")
  expect_error(checkor(stop("that")), "^that$")
  expect_identical(checkor(stop("that"), y <- 2), TRUE)
  expect_error(checkor(stop("that"), stop("this"), stop("these")), "^that OR this OR these$")
  expect_error(checkor(stop("that"), stop("this"), stop("that")), "^that OR this$")

  fun <- function(x) checkor(check_flag(x))
  expect_error(checkor(fun(1)), "x must be class logical")
})

