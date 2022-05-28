#' Raport automatyczny z testu t
#'
#' Funkcja tworząca automatyczne fragmenty raportu z testu t-Studenta.
#'
#' @param wynik_testu \code{\link[stats]{t.test}}.
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
#' t <- t.test(iris[iris$Species == "setosa", ]$Petal.Length, iris[iris$Species == "versicolor", ]$Petal.Length)
#' raport_t(t, "długością płatków u różnych gatunków irysów")
#'
raport_t <- function(wynik_testu, miedzy, alpha = 0.05) {
  p <- wynik_testu$p.value
  t <- abs(wynik_testu$statistic)
  dM <- abs(wynik_testu$estimate[[1]] - wynik_testu$estimate[[2]])
  df <- wynik_testu$parameter
  typ <- case_when(
    wynik_testu$method %in% c("Welch Two Sample t-test", " Two Sample t-test") ~ "t-Studenta dla prób niezależnych",
    wynik_testu$method == "Paired t-test" ~ "t-Studenta dla prób zależnych"
  )

  elem1 <- paste0("Celem sprawdzenia istotności różnicy między ", miedzy, " wykonano test ", typ, ". Test wykazał, że różnica w średnich ($\u0394M = ", dM, "$) między grupami jest")
  ifelse(p < alpha,
    elem2 <- paste0("istotna statystycznie "),
    elem2 <- paste0("nieistotna statystycznie ")
  )
  elem3 <- paste0("($t(", df, ") ", apa_num_pl(t), "$; $p ", print_p_pl(p), "$).")
  paste0(elem1, elem2, elem3)
}
