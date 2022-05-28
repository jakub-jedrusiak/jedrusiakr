#' Raport automatyczny z testu U
#'
#' Funkcja tworząca automatyczne fragmenty raportu z testu U Manna-Whitneya.
#'
#' @param wynik_testu \code{\link[coin:wilcox_test]{coin::wilcox_test}}.
#' @param miedzy character. Uzupełnia zdanie „Celem sprawdzenia istotności różnicy między XXX.”
#' @param alpha numeric. Punkt odcięcia dla istotności statystycznej.
#'
#' @export
#'
#' @importFrom coin pvalue statistic
#'
#' @return Celem sprawdzenia istotności różnicy między długością płatków u
#'   różnych gatunków irysów wykonano test U Manna-Whitneya. Test wykazał, że
#'   różnica jest istotna statystycznie (Z = -7,468; p < 0,001).
#'
#' @examples
#' library(dplyr)
#' U <- iris %>%
#'   filter(Species %in% c("setosa", "versicolor")) %>%
#'   coin::wilcox_test(Sepal.Length ~ Species, .)
#' raport_U(U, "długością płatków u różnych gatunków irysów")
#'
raport_U <- function(wynik_testu, miedzy, alpha = 0.05) {
  p <- pvalue(wynik_testu)
  Z <- abs(statistic(wynik_testu))

  elem1 <- paste0("Celem sprawdzenia istotności różnicy między ", miedzy, " wykonano test U Manna-Whitneya. Test wykazał, że różnica jest ")
  ifelse(p < alpha,
    elem2 <- paste0("istotna statystycznie "),
    elem2 <- paste0("nieistotna statystycznie ")
  )
  elem3 <- paste0("($Z ", apa_num_pl(Z), "$; $p ", print_p_pl(p), "$).")
  paste0(elem1, elem2, elem3)
}
