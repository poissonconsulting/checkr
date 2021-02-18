#' Check OR
#'
#' Checks that at least one check passes.
#'
#' @inheritParams params
#' @param ... The checks to check.
#' 
#' @return An invisible flag indicating whether at least one check passes (if it doesn't throw an error).
#' @export
#'
#' @examples
#' checkor(check_null(NULL), check_null(1), error = FALSE)
#' checkor(check_null(1), check_null(1), error = FALSE)
#' checkor(check_null(1), check_null(2), error = FALSE)
checkor <- function(..., error = TRUE) {
  args <- substitute(list(...))
  args <- args[-1]
  n <- length(args)
  if (identical(n, 0L)) return(invisible(TRUE))
  args <- lapply(args, try_check)
  args <- args[vapply(args, is.try_error, TRUE)]
  if (!identical(length(args), n)) return(invisible(TRUE))
  args <- lapply(args, try_message)
  args <- unlist(args)
  args <- args[!duplicated(args)]
  args <- paste(args, collapse = " OR ")
  chk_fail(args, error = error)
  invisible(FALSE)
}
