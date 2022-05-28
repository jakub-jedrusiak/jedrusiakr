#' Raport automatyczny z regresji
#'
#' Funkcja tworząca automatyczne fragmenty raportu z analizy regresji.
#'
#' @param lm \code{\link[stats]{lm}}.
#' @param miedzy character. Uzupełnia zdanie „Celem sprawdzenia zależności między XXX.”
#' @param alpha numeric. Punkt odcięcia dla istotności statystycznej.
#'
#' @importFrom broom glance
#'
#' @export
#'
#' @return Celem sprawdzenia zależności między masą brylantu a jego ceną, przeprowadzono
#' analizę regresji. Model okazał się istotny statystycznie (F(1;53938) = 30410; p < 0,001)
#' i wyjaśnia 85% wariancji.
#'
#' @examples
#' data(diamonds, package = "ggplot2")
#' llm <- lm(price ~ carat, diamonds)
#' raport_lm(llm, "masą brylantu a jego ceną")
#'
raport_lm <- function(lm, miedzy, alpha = 0.05) {
  p <- glance(lm)$p.value
  df1 <- glance(lm)$df
  df2 <- glance(lm)$df.residual
  f <- glance(lm)$statistic
  r2 <- (glance(lm)$adj.r.squared * 100) |>
    round() |>
    paste0("%")

  elem1 <- paste0("Celem sprawdzenia zależności między ", miedzy, " przeprowadzono analizę regresji. ")
  ifelse(p < alpha,
    elem2 <- paste0("Model okazał się istotny statystycznie "),
    elem2 <- paste0("Model okazał się nieistotny statystycznie ")
  )
  elem3 <- paste0("($F(", df1, ", ", df2, ") ", apa_num_pl(f, 2L), "$; $p ", print_p_pl(p), "$)")
  ifelse(p < alpha,
    elem4 <- paste0(" i wyjaśnia ", r2, " wariancji."),
    elem4 <- "."
  )
  paste0(elem1, elem2, elem3, elem4)
}
