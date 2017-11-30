context("join")

test_that("join", {

data1 <- data.frame(x = 1:2)
data2 <- data.frame(x = 3:5, y = 2L)

expect_identical(check_join(data2, data1, by = c(y = "x")), data2)
expect_error(check_join(data1, data2), "join between data1 and data2 violates referential integrity")
expect_error(check_join(data1, data2, by = c(x = "y")), "column 'y' in data2 must be a unique key")
expect_error(check_join(data2, data1, by = c(x = "y")), "data1 column names must include 'y'")
})

test_that("join different classes", {

data1 <- data.frame(x = 1:2)
data2 <- data.frame(x = c("3","4","5"), y = "2")

expect_identical(check_join(data2, data1, by = c(y = "x")), data2)
expect_error(check_join(data1, data2), "join between data1 and data2 violates referential integrity")
expect_error(check_join(data1, data2, by = c(x = "y")), "column 'y' in data2 must be a unique key")
expect_error(check_join(data2, data1, by = c(x = "y")), "data1 column names must include 'y'")
})

test_that("join missing values", {

data1 <- data.frame(x = c(NA, 1:2))
data2 <- data.frame(x = c("3","4","5"), y = c("2", NA, "2"))

expect_identical(check_join(data2, data1, by = c(y = "x")), data2)
expect_error(check_join(data1, data2), "join between data1 and data2 violates referential integrity")
expect_error(check_join(data1, data2, by = c(x = "y")), "column 'y' in data2 must be a unique key")
expect_error(check_join(data2, data1, by = c(x = "y")), "data1 column names must include 'y'")

data1 <- data.frame(x = c(1:2))
data2 <- data.frame(x = c("3","4","5"), y = c("2", NA, "2"))

expect_error(check_join(data2, data1, by = c(y = "x")), "join between data2 and data1 violates referential integrity")
})
