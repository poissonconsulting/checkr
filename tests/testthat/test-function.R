test_that("function", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  expect_identical(check_function(character), character)
  expect_error(check_function(character()), "character[(][)] must be a function")
  expect_error(check_function(character, nargs = 0L), "character must have 0 arguments")
})
