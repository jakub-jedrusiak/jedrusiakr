#' Raport automatyczny z testu t
#'
#' Funkcja tworząca automatyczne fragmenty raportu z testu t-Studenta.
#'
#' @param wynik_testu [stats::t.test()].
#' @param miedzy character. Uzupełnia zdanie „Celem sprawdzenia istotności różnicy między XXX.”
#' @param alpha numeric. Punkt odcięcia dla istotności statystycznej.
#'
#' @export
#'
#' @importFrom dplyr case_when
#'
#' @return Celem sprawdzenia istotności różnicy między długością płatków u
#'   różnych gatunków irysów wykonano test t-Studenta dla prób niezależnych.
#'   Test wykazał, że różnica w średnich (ΔM = 2,798) między grupami jest
#'   istotna statystycznie (t(62,1) = 39,5; p < 0,001).
#' @examples
#' library(dplyr)
#' t <- iris %>%
#'   filter(Species %in% c("setosa", "versicolor")) %>%
#'   t.test(Petal.Length ~ Species, .)
#' raport_t(t, "długością płatków u różnych gatunków irysów")
#'
raport_t <- function(wynik_testu, miedzy, alpha = 0.05) {
  p <- wynik_testu$p.value
  t <- abs(wynik_testu$statistic)
  df <- wynik_testu$parameter
  typ <- case_when(
    wynik_testu$method %in% c("Welch Two Sample t-test", " Two Sample t-test") ~ "$t$-Studenta dla pr\u00f3b niezale\u017cnych",
    wynik_testu$method == "Paired t-test" ~ "$t$-Studenta dla pr\u00f3b zale\u017cnych"
  )
  if (typ == "$t$-Studenta dla pr\u00f3b niezale\u017cnych") {
    dM <- abs(wynik_testu$estimate[[1]] - wynik_testu$estimate[[2]])
    obiekt <- "grupami"
  }
  if (typ == "$t$-Studenta dla pr\u00f3b zale\u017cnych") {
    dM <- abs(wynik_testu$estimate)
    obiekt <- "zmiennymi"
  }


  elem1 <- paste0("Celem sprawdzenia istotno\u015bci r\u00f3\u017cnicy mi\u0119dzy ", miedzy, " wykonano test ", typ, ". Test wykaza\u0142, \u017ce r\u00f3\u017cnica w \u015brednich ($\u0394M ", apa_num_pl(dM), "$) mi\u0119dzy ", obiekt, " jest ")
  ifelse(p < alpha,
    elem2 <- paste0("istotna statystycznie "),
    elem2 <- paste0("nieistotna statystycznie ")
  )
  elem3 <- paste0("($t(", apa_num_pl(df, add_equals = FALSE), ") ", apa_num_pl(t), "$; $p ", print_p_pl(p), "$).")
  paste0(elem1, elem2, elem3)
}
