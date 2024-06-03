#' Means plot
#'
#' @param df a data frame
#' @param group group variable to summarise by
#' @param col column to summarise
#' @param x_labels vector of labels for x axis
#' @param xlab x axis label
#' @param ylab y axis label
#' @param nudge_y vertical nudge for labels
#'
#' @return ggplot object, a bar plot showing means with error bars (95% CI)
#' @export
#'
#' @examples
M_plot <- function(df, group, col, x_labels, xlab = NULL, ylab = NULL, nudge_y = -1, fill = "#1E88E5") {
  df %>%
    group_by({{ group }}) %>%
    summarise(
      m = mean({{ col }}, na.rm = TRUE),
      sd = sd({{ col }}, na.rm = TRUE),
      n = n(),
      se = sd / sqrt(n)
    ) %>%
  ggplot(M, aes(!!parse_expr(colnames(M)[1]), m)) +
    geom_col(fill = fill) +
    geom_label(aes(label = format(round(m, 1), decimal.mark = ","), nudge_y = nudge_y)) +
    geom_errorbar(aes(ymin = m - 1.96 * se, ymax = m + 1.96 * se), width = 0.3) +
    labs(
      x = xlab,
      y = ylab
    ) +
    scale_x_discrete(labels = x_labels) +
    scale_y_continuous(labels = \(label) format(label, decimal.mark = ",")) +
    theme_minimal() +
    theme(
      panel.grid.major.x = element_blank(),
      axis.title.x = element_text(colour = "gray60", margin = margin(t = 10)),
      axis.title.y = element_text(colour = "gray60", margin = margin(r = 10)),
      axis.text.y = element_text(colour = "gray60"),
      axis.text.x = element_text(colour = "gray10"),
    )
}
