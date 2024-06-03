#' Report M and SD
#'
#'
#' @param df data frame
#' @param column column of which to calculate M and SD
#' @param group optional grouping variable
#'
#' @return Ciąg znaków zgodny z przykładem:
#' "$M = 5,01$; $SD = 0,35$"
#' @export
#'
#' @examples
#' msd(iris, Sepal.Length)
#' msd(iris, Sepal.Length, Species == "setosa")
msd <- function(df, column, filter, pl = TRUE) {
  column <- rlang::ensym(column)
  filter <- rlang::enquo(filter)
  if (missing(filter)) {
    df <- df %>%
      dplyr::select(!!column)
  } else {
    df <- df %>%
      dplyr::filter(!!filter) %>%
      dplyr::select(!!column)
  }
  df <- df %>%
    dplyr::summarise(
      M = round(mean(!!column), 2),
      SD = round(sd(!!column), 2)
    )
  if (pl) {
    df <- mutate(df, across(where(is.numeric), \(x) format_pl(x)))
  }
  with(df, glue::glue("$M = {M}$; $SD = {SD}$"))
}
