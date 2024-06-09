#' cat names in a list as kable calls
#'
#' @param list a named list
#'
#' @return
#' @export
#'
#' @examples
#' my_list <- list(a = mtcars, b = iris)
#' cat_kable(my_list)
cat_kable <- function(list) {
  if (!rlang::is_named(list)) cli::cli_abort("`list` must be named")
  object <- deparse(substitute(list))
  for (name in names(list)) {
    cat(glue::glue("kable({object}[[\"{name}\"]])"), sep = "\n")
  }
}
