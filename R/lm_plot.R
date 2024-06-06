#' Plot for linear regression
#'
#' @param df a data frame
#' @param x variable for x axis
#' @param y variable for y axis
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> additional arguments to pass to `aes()`
#' @param xlab label for x axis
#' @param ylab label for y axis
#'
#' @return
#' @export
#'
#' @examples
lm_plot <- function(df, x, y, ..., xlab = NULL, ylab = NULL, line_colour = "#1E88E5", point_colour = "#9ECAE1") {
  df %>%
    ggplot(aes({{ x }}, {{ y }}, ...)) +
    geom_jitter(alpha = 0.7, colour = point_colour) +
    geom_smooth(method = "lm", se = FALSE, colour = line_colour) +
    labs(x = xlab, y = ylab) +
    theme_minimal()
}
