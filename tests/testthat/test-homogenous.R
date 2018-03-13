context("homogenous")

test_that("length1", {
  expect_identical(check_homogenous(2), 2)
  expect_identical(check_homogenous(list(1)), list(1))
  
  x <- list()
  y <- list()
  class(x) <- c("a", "b")
  class(y) <- c("b", "a")
  z <- list(x, y)
  
  expect_identical(check_homogenous(z), z)
  expect_identical(check_homogenous(z, recursive = TRUE), z)
  expect_error(check_homogenous(z, strict = TRUE), "elements in z must have identical classes")
  class(y) <- c("a")
  z <- list(x, y)
  expect_identical(check_homogenous(z), z)
  expect_error(check_homogenous(z, strict = TRUE), "elements in z must have identical classes")
  class(y) <- c("a", "b")
  z <- list(x, y)
  expect_identical(check_homogenous(z), z)
  expect_identical(check_homogenous(z, strict = TRUE), z)
  
  zz <- list(z, z)
  expect_identical(check_homogenous(zz), zz)
  expect_identical(check_homogenous(zz, strict = TRUE), zz)
  expect_identical(check_homogenous(zz, strict = TRUE, recursive = TRUE), zz)
  zz[[1]][[1]] <- 1
  expect_identical(check_homogenous(zz, strict = TRUE), zz)
  expect_error(check_homogenous(zz, strict = TRUE, recursive = TRUE), "elements in elements in zz must have identical classes")
})
