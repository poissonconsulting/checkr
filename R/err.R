err_deparse <- function(x) {
  if (!is.character(x)) x <- deparse(x) 
  if (isTRUE(is.na(x))) x <- "NA"
  x
}

co_and <- function(object, one = "%o has %n value%s: %c", object_name = substitute(object)) {
  object_name <- err_deparse(object_name)
  co(object, one = one, conjunction = "and", object_name = object_name)
}

cc_and <- function(object) {
  cc(object, conjunction = "and")
}

cc_or <- function(object) {
  cc(object, conjunction = "or")
}
