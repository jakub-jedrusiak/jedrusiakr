#' Plot for linear regression
#'
#' @param df a data frame
#' @param x variable for x axis
#' @param y variable for y axis
#' @param xlab label for x axis
#' @param ylab label for y axis
#'
#' @return
#' @export
#'
#' @examples
lm_plot <- function(df, x, y, xlab, ylab) {
  df %>%
    ggplot(aes({{ x }}, {{ y }})) +
    geom_jitter(alpha = 0.7, colour = "#9ECAE1") +
    geom_smooth(method = "lm", se = FALSE, colour = "#1E88E5") +
    labs(x = xlab, y = ylab) +
    theme_minimal()
}
