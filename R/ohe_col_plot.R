#' One Hot Encoding Column Plot
#'
#' @param df dataframe
#' @param col column with multiple choice values
#' @param cols_to_delete names of columns to be deleted, that is additional columns after usually a comma that isn't different to the main column
#' @param ... "new" = "old" column rename pairs
#' @param xlab x-axis label
#' @param ylab y-axis label
#' @param fill column fill colour
#' @param color column outline colour
#' @param angle x-axis text angle
#' @param hjust x-axis text horizontal justification (between 0 and 1)
#' @param vjust x-axis text vertical justification (between 0 and 1)
#'
#' @return
#' @export
#'
#' @examples
ohe_col_plot <- function(df, col, cols_to_delete = NULL, ..., xlab = NULL, ylab = NULL, fill = "#6BAED5", colour = "#2171B5", angle = 90, hjust = 1, vjust = 0.5) {
  require(rlang)
  col <- enquo(col)
  col_name <- expr_text(col) %>%
    str_remove("~")
  cols_to_delete <- enquo(cols_to_delete)
  df <- df %>%
    select(!!col) %>%
    filter(!is.na(!!col))
  nrow <- nrow(df)
  df %>%
    lares::ohe_commas(!!col, sep = ", *", noval = NA, remove = TRUE) %>%
    set_names(., str_remove(names(.), paste0(col_name, "_"))) %>%
    select(-!!cols_to_delete) %>%
    rename(!!!list2(...)) %>%
    pivot_longer(cols = everything(), names_to = "name", values_to = "value") %>%
    filter(value) %>%
    freq_table(name) %>%
    arrange(n) %>%
    mutate(
      name = str_wrap(name, 20),
      name = fct_inorder(name),
      prop = (n / nrow) * 100
    ) %>%
    ggplot(aes(name, prop)) +
    geom_col(fill = fill, colour = colour) +
    geom_label(aes(label = paste0(format(round(prop, 1), decimal.mark = ","), "%"))) +
    scale_y_continuous(labels = scales::percent_format(scale = 1)) +
    labs(
      x = xlab,
      y = ylab
    ) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = angle, vjust = vjust, hjust = hjust),
      panel.grid.minor = element_blank(),
      panel.grid.major.x = element_blank()
    )
}
