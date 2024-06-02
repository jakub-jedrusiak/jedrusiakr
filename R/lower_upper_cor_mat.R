#' Łączenie macierzy korelacji
#'
#' `lower_upper_cor_mat` łączy dwie macierze korelacji tak, że jedna połowa
#' jest pod przekątną, a druga nad przekątną. Użyteczne w raportowaniu. W
#' przeciwieństwie do klasycznego [psych::lowerUpper()], ta
#' obsługuje obiekt typu [rstatix::cor_mat()].
#'
#' @param lower cor_mat. Macierz dolna.
#' @param upper cor_mat. Macierz górna.
#' @param signif logical. Jeśli TRUE, dodaje gwiazdki na oznaczenie istotności.
#'
#' @return Zwraca obiekt typu [tibble::tibble()].
#' @export
#'
#' @seealso [psych::lowerUpper()], [rstatix::cor_mat()]
#'
#' @import tibble
#' @importFrom rstatix cor_mark_significant
#' @importFrom psych lowerUpper
#'
#' @examples
#' library(dplyr)
#' library(rstatix)
#'
#' r_mat_setosa <- iris %>%
#'   filter(Species == "setosa") %>%
#'   select(where(is.numeric)) %>%
#'   cor_mat()
#'
#' r_mat_virginica <- iris %>%
#'   filter(Species == "virginica") %>%
#'   select(where(is.numeric)) %>%
#'   cor_mat()
#'
#' lower_upper_cor_mat(r_mat_setosa, r_mat_virginica)
lower_upper_cor_mat <- function(lower, upper, signif = TRUE) {
  if (signif) {
    lower <- cor_mark_significant(lower, c(0, 1e-03, 1e-02, 0.05, 1), c("***", "**", "*", ""))
    upper <- cor_mark_significant(upper, c(0, 1e-03, 1e-02, 0.05, 1), c("***", "**", "*", ""))
  }
  lower <- lower |>
    column_to_rownames() |>
    t()
  upper <- upper |>
    column_to_rownames()
  lowerUpper(lower = lower, upper = upper) |>
    as_tibble(rownames = "rowname")
}
