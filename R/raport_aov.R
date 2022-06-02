#' Raport automatyczny z jednoczynnikowej analizy wariancji
#'
#' Funkcja tworząca automatyczne fragmenty raportu jednoczynnikowej (!) z analizy wariancji.
#'
#' @export
#'
#' @return
#' Celem sprawdzenia różnic w zakresie lęku u osób o różnym stopniu obciążenia
#' pracą przeprowadzono jednoczynnikową analizę wariancji. Wykazała ona, że istnieją istotne
#' różnice (F(2,597) = 5,22; p = 0,006).
#'
#' @param aov Analiza wariancji
#' @param roznic Uzupełnienie zdania "Celem sprawdzenia różnic "
#'
#' @importFrom broom tidy
#'
#' @examples
#' iris_aov <- aov(Sepal.Length ~ Species, iris)
#' raport_aov(iris_aov, "w zakresie długości płatków u różnych gatunków irysów")

raport_aov <- function(aov, roznic) {
  if (length(aov$xlevels) > 1) stop("Obecnie funkcja wymaga jednocznynnikowej analizy wariancji.")

  tidy_aov <- broom::tidy(aov)
  p <- tidy_aov$p.value[[1]]
  df1 <- tidy_aov$df[[1]]
  df2 <- tidy_aov$df[[2]]
  f <- tidy_aov$statistic[[1]]

  elem1 <- paste0("Celem sprawdzenia r\u00f3\u017cnic ", roznic, " przeprowadzono jednoczynnikow\u0105 analiz\u0119 wariancji. ")

  ifelse(
    p < 0.05,
    elem2 <- "Wykaza\u0142a ona, \u017ce istniej\u0105 istotne statystycznie r\u00f3\u017cnice ",
    elem2 <- "Nie wykaza\u0142a ona istnienia istotnych statystycznie r\u00f3\u017cnic "
  )

  elem3 <- paste0("($F (", df1, ", ", df2, ") ", apa_num_pl(f), "$; $p ", print_p_pl(p), "$).")

  paste0(elem1, elem2, elem3)
}
