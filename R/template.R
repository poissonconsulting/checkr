#' Parameters for checkr functions
#'
#' Descriptions of the parameters for the checkr functions.
#'
#' @keywords internal
#' @name params
#' @param x The object to check.
#' @param x_name A string of the name of the object x.
#' @param error A flag indicating whether to throw an informative error or 
#' immediately generate an informative message if the check fails.
#' @param pattern A string of the regular expression.
#' @param y_name A string of the name of the object y.
#' @param values NULL or a vector specifying the values.
#' @param exclusive A flag indicating whether other columns are not permitted.
#' @param by A character vector or named character vector of the columns to join by. 
#' @param colnames A character vector of the column names.
#' @param na_distinct A flag specifying whether missing values should be considered distinct.
#' @param sorted A flag indicating whether the vector must be sorted.
#' @param only A flag indicating whether only the actual values are permitted.
#' It only affects values with two or less non-missing elements.
#' @param unique A flag indicating whether the values must be unique.
#' @param length A flag indicating whether x should have elements (versus no elements) 
#' or a missing value indicating no requirements or a count or count range of the 
#' number of elements or a count vector of the permitted number of elements.
#' @param complete A flag indicating whether all the possible names have to be represented.
#' @param coerce A flag indicating whether to coerce a scalar integer to a dbl and drop attributes including names.
#' @param tzone A string of the time zone.
#' @param strict A flag indicating whether all the objects must have identical classes or just share one or more classes.
#' @param recursive A flag indicating whether the check should be applied recursively.
#' @param ncol A flag indicating whether x should have columns (versus no columns) or a missing value indicating no requirements or a count or count range of the number of columns.
#' @param nlevels A flag indicating whether x should have elements (versus no elements) or a missing value indicating no requirements or a count or count range of the number of elements.
#' @param nrow A flag indicating whether x should have rows (versus no rows) or a missing value indicating no requirements or a count or count range of the number of rows.
#' @param nargs A count of the number of arguments or count range of the minimum and maximum number of arguments.
#' @param levels A character vector of the levels.

NULL
