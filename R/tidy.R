#' Tidy wrapper
#'
#' @param ... arguments to pass to `broom::tidy()`
#'
#' @return a tibble with additional columns for significance
#' @export
#'
#' @examples
tidy <- function(...) {
  broom::tidy(...) %>%
    rstatix::add_significance(p.col = "p.value")
}
