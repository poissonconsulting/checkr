test_that("rbind column names", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  expect_identical(check_rbind(datasets::mtcars, datasets::mtcars), datasets::mtcars)
  expect_identical(check_rbind(datasets::mtcars[c("cyl", "mpg")], 
                               datasets::mtcars[c("mpg", "cyl")]),
                   datasets::mtcars[c("cyl", "mpg")])
  x <- datasets::mtcars[c("cyl", "mpg")]
  expect_error(check_rbind(x, datasets::mtcars[c("mpg", "cyl")], order = TRUE),
               "x column names must be identical to 'mpg' and 'cyl'")
  expect_identical(check_rbind(x, x, order = TRUE), x)
  x <- datasets::mtcars[c("cyl", "mpg", "disp")]
  expect_error(check_rbind(x, datasets::mtcars[c("hp", "mpg", "cyl")]), "x column names must include and only include 'hp', 'mpg' and 'cyl'")
  expect_identical(check_rbind(x, datasets::mtcars[c("hp", "mpg", "cyl")], exclusive = FALSE),
                   x)
  expect_error(check_rbind(x, datasets::mtcars[c("hp", "mpg", "cyl")], order = TRUE),
               "x column names must be identical to 'hp', 'mpg' and 'cyl'")
  expect_error(check_rbind(x, datasets::mtcars[c("hp", "mpg", "cyl")], order = TRUE, exclusive = FALSE), "x column names must include 'mpg' and 'cyl' in that order")
})

test_that("rbind column names", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  x <- datasets::mtcars[c("cyl", "mpg")]
  y <- x
  expect_identical(check_rbind(x, y), x)
  y$cyl <- as.character(y$cyl)

  expect_error(check_rbind(x, y, y_name = "ee"), "column 'cyl' in x and ee must have the same classes")
  
  y$mpg <- as.character(y$mpg)
  expect_error(check_rbind(x, y, y_name = "ee"), "columns 'cyl' and 'mpg' in x and ee must have the same classes")
})

