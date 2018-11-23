context("tzone")

test_that("tzone", {
  expect_error(check_tzone(Sys.Date()), 
               "Sys.Date[(][)] time zone must be 'UTC' [(]not 'NULL'[)]")
  expect_error(check_tzone(Sys.time()), 
               "Sys.time[(][)] time zone must be 'UTC' [(]not 'NULL'[)]")
  x <- as.POSIXct("2000-01-02 03:04:55", tz = "Etc/GMT+8")
  expect_error(check_tzone(x, tzone = "PST8PDT"), 
               "x time zone must be 'PST8PDT' [(]not 'Etc[/]GMT[+]8'[)]")
  expect_identical(check_tzone(x, tzone = "Etc/GMT+8"), x)
})