#' Frequency table
#'
#' A wrapper around `rstatix::freq_table()` with unrounded proportions. Useful for ggplot2.
#'
#' @param ... parameters passed to `rstatix::freq_table()`
#'
#' @return A tibble with frequency and proportion
#' @export
#'
#' @examples
freq_table <- function(...) {
  rstatix::freq_table(...) %>%
    mutate(prop = n / sum(n) * 100)
}
