#' Proportions plot
#'
#' Percent stacked bar plot with labels. Should be exported with `width = 12` and `height = 4`.
#'
#' @param freq_df a df returned by `freq_table()`
#' @param legend_title title for the legend
#' @param x column to use for x axis
#' @param order logical, whether to order the groups by proportion
#' @param xlab x axis label
#' @param ylab y axis label
#' @param fill_palette RColorBrewer color palette name for the plot
#'
#' @return ggplot object, a plot of proportions summed to 100%, horizontal
#' @export
#'
#' @examples
prop_plot <- function(freq_df, legend_title, x = 1, order = FALSE, xlab = NULL, ylab = NULL, fill_palette = "Blues", ...) {
  freq_df <- freq_df %>%
    arrange(group) %>%
    mutate(
      group = str_wrap(group, 20) %>%
        fct_inorder(),
      cumsum = cumsum(prop),
      center = (lag(cumsum, default = 0) + cumsum) / 2,
      label = case_when(
        prop >= 5 ~ paste0(str_trim(format(round(prop, 1), decimal.mark = ","), side = "both"), "%"),
        .default = NULL
      )
    )

  if (order) {
    freq_df <- mutate(freq_df, group = fct_reorder(group, -n))
  }

  freq_df %>%
    ggplot(aes(x = {{ x }}, y = prop, fill = group)) +
    geom_col(position = position_fill(reverse = TRUE)) +
    geom_label(aes(label = label), fill = "white", position = position_fill(reverse = TRUE, vjust = 0.5)) +
    labs(
      x = xlab,
      y = ylab
    ) +
    scale_y_continuous(labels = scales::label_percent()) +
    scale_fill_brewer(palette = fill_palette, name = legend_title) +
    coord_flip() +
    theme_minimal() +
    theme(
      axis.text.y = element_blank(),
      panel.grid.minor = element_blank(),
      panel.grid.major.y = element_blank(),
      legend.position = "bottom",
      ...
    )
}
