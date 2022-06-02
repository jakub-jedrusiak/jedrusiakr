#' Raport automatyczny z testu Kruskala-Wallisa
#'
#' Funkcja tworząca automatyczne fragmenty raportu z testu Kruskala-Wallisa
#'
#' @export
#'
#' @return
#' Celem sprawdzenia różnic w zakresie lęku u osób o różnym stopniu obciążenia
#' pracą przeprowadzono jednoczynnikową analizę wariancji. Wykazała ona, że istnieją istotne
#' różnice (F(2,597) = 5,22; p = 0,006).
#'
#' @param kruskaltest obiekt testu Kruskala-Wallisa \code{\link[stats]{kruskal.test}}
#' @param roznic Uzupełnienie zdania "Celem sprawdzenia różnic "
#'
#' @importFrom broom tidy
#'
#' @examples
#' iris_KW <- kruskal.test(Sepal.Length ~ Species, iris)
#' raport_KW(iris_KW, "w zakresie długości płatków u różnych gatunków irysów")

raport_KW <- function(kruskaltest, roznic) {

  tidy_KW <- broom::tidy(kruskaltest)
  p <- tidy_KW$p.value[[1]]
  df <- tidy_KW$parameter[[1]]
  chi <- tidy_KW$statistic[[1]]

  elem1 <- paste0("Celem sprawdzenia r\u00f3\u017cnic ", roznic, " przeprowadzono nieparametryczny test Kruskala-Wallisa. ")

  ifelse(
    p < 0.05,
    elem2 <- "Wykaza\u0142 on, \u017ce istniej\u0105 istotne statystycznie r\u00f3\u017cnice ",
    elem2 <- "Nie wykaza\u0142 on istnienia istotnych statystycznie r\u00f3\u017cnic "
  )

  elem3 <- paste0("($\\chi^2 (", df, ") ", apa_num_pl(chi), "$; $p ", print_p_pl(p), "$).")

  paste0(elem1, elem2, elem3)
}
