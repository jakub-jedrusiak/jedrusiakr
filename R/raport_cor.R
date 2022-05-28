#' Raport automatyczny z korelacji
#'
#' Funkcja tworząca automatyczne fragmenty raportu z analizy korelacji.
#'
#' @param wynik_testu \code{\link[stats]{cor.test}}.
#' @param miedzy character. Uzupełnia zdanie „Przeprowadzono analizę korelacji między XXX.”
#' @param alpha numeric. Punkt odcięcia dla istotności statystycznej.
#' @param method character. Rodzaj korelacji – "pearson" albo "spearman"
#'
#' @export
#'
#' @importFrom dplyr case_when
#'
#' @return Przeprowadzono analizę korelacji Pearsona między masą a ceną
#'   brylantu. Test wykazał istnienie istotnej, bardzo wysokiej, dodatniej
#'   korelacji między zmiennymi ($r = 0,922$; $p < 0,001$).
#' @examples
#' data(diamonds, package = "ggplot2")
#' r <- cor.test(diamonds$carat, diamonds$price)
#' raport_cor(r, "masą a ceną brylantu")
#'
raport_cor <- function(wynik_testu, miedzy, method = "pearson", alpha = 0.05) {
  p <- wynik_testu$p.value
  r <- wynik_testu$estimate
  r_interp <- case_when(
    abs(r) < 0.2 ~ "bardzo słabej",
    abs(r) < 0.4 ~ "słabej",
    abs(r) < 0.6 ~ "umiarkowanej",
    abs(r) < 0.8 ~ "wysokiej",
    abs(r) < 1 ~ "bardzo wysokiej",
    abs(r) == 1 ~ "pełnej"
  )
  znak <- ifelse(r > 0, "dodatniej", "ujemnej")
  typ <- case_when(
    method == "pearson" ~ "Pearsona",
    method == "spearman" ~ "Spearmana"
  )

  elem1 <- paste0("Przeprowadzono analizę korelacji ", typ, " między ", miedzy, ". ")
  ifelse(p < alpha,
    elem2 <- paste0("Test wykazał istnienie istotnej, ", r_interp, ", ", znak, " korelacji między zmiennymi "),
    elem2 <- paste0("Test wykazał brak istotnej korelacji między zmiennymi ")
  )
  elem3 <- paste0("($r ", apa_num_pl(r), "$; $p ", print_p_pl(p), "$).")
  paste0(elem1, elem2, elem3)
}
