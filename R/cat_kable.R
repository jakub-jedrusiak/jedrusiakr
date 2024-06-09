#' cat names in a list as kable calls
#'
#' @param list a named list
#'
#' @return
#' @export
#'
#' @examples
#' cat_kable(list(a = mtcars, b = iris))
cat_kable <- function(list) {
  if (!rlang::is_named(list)) cli::cli_abort("`list` must be named")
  object <- rlang::get_expr(list)
  for (name in names(list)) {
    cat(glue::glue("kable({object}[[\"{name}\"]])"), sep = "\n")
  }
}
