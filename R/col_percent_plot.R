#' Column percent plot
#'
#' @param freq_df a df returned by `freq_table()`. Must contain a column `prop`
#' @param x column to use for x axis
#' @param nudge_y vertical nudge for labels
#' @param xlab x axis label
#' @param ylab y axis label
#' @param caption caption
#' @param pl logical, whether to use Polish formatting
#' @param fill color for the plot
#'
#' @return ggplot object, a col plot showing a percentage in a group
#' @export
#'
#' @examples
col_percent_plot <- function(freq_df, x, nudge_y = -0.03, xlab = NULL, ylab = NULL, caption = NULL, pl = TRUE, fill = "#2171B5") {
  ggplot(df, aes({{ x }}, prop)) +
    geom_col(fill = fill) +
    geom_label(aes(label = paste0(format(round(prop), decimal.mark = ifelse(pl, ",", ".")), "%")), nudge_y = nudge_y) +
    scale_y_continuous(labels = scales::label_percent()) +
    labs(
      x = xlab,
      y = ylab,
      caption = caption
    ) +
    theme_minimal() +
    theme(
      panel.grid.major.x = element_blank(),
      panel.grid.minor.y = element_blank(),
      axis.title.x = element_text(margin = margin(t = 10))
    )
}
