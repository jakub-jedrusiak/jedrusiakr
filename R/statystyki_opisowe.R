#' Statystyki opisowe
#'
#' Zestaw podstawowych statystyk dla danego typu skali pomiarowej, zgodny z
#' wymaganiami prowadzących. \code{statystyki_opisowe} służy do opisu całych
#' sprecyzowanych kolumn. \code{statystyki_opisowe_by} robi to samo, ale pozwala
#' na dodanie zmiennych grupujących.
#'
#' @param df data.frame lub tibble. Zbiór danych.
#' @param type character. Skala pomiarowa. Może być \code{"kategorialna"}, \code{"porzadkowa"} albo \code{"ilosciowa"}.
#' @param ... tidyselect. Kolumny do opisania. Jeśli nie sprecyzowano, opisywane są wszystkie dostępne kolumny. Można użyć czasowników tidyselect jak \code{\link[dplyr]{starts_with}}.
#'
#' @return Zwracana jest nazwana lista, której zawartość zależy od skali pomiarowej.
#' \describe{
#'   \item{kategorialna}{\describe{
#'     \item{licznosc}{tabele liczności}
#'   }}
#'   \item{porządkowa}{\describe{
#'     \item{licznosc}{tabele liczności}
#'     \item{opisowe}{\code{var} – nazwa zmiennej; \code{N} – liczba obserwacji; \code{Me} – mediana; \code{R} – rozstęp; \code{RQ} – rozstęp ćwiartkowy; \code{VQ} – współczynnik zmienności wzg. mediany; \code{VQ_interp} – interpretacja \code{VQ}; \code{`NA`} – liczba braków danych}
#'   }}
#'   \item{ilościowa}{\describe{
#'     \item{opisowe}{\code{var} – nazwa zmiennej; \code{N} – liczba obserwacji; \code{M} – średnia; \code{SD} – odchylenie standardowe; \code{A} – skośność; \code{K} – kurtoza; \code{`NA`} – liczba braków danych}
#'     \item{test_shapiro_wilka}{test normalności Shapiro-Wilka z dodaną istotnością}
#'   }}
#' }
#'
#' @export
#'
#' @import dplyr
#' @importFrom questionr freq
#' @importFrom moments skewness kurtosis
#' @importFrom rstatix add_significance shapiro_test
#' @importFrom tidyr pivot_longer
#'
#' @examples
#' statystyki_opisowe(iris, "ilosciowa", Sepal.Width)
#' statystyki_opisowe(iris, "ilosciowa", where(is.numeric)) # z czasownikiem tidyselect

statystyki_opisowe <- function(df, type = c("kategorialna", "porzadkowa", "ilosciowa"), ...) {
  if (!type %in% c("kategorialna", "porzadkowa", "ilosciowa")) stop("Skala może by\u0107 wy\u0142\u0105cznie \"kategorialna\", \"porzadkowa\" albo \"ilosciowa\".")

  if (!missing(...)) df_temp <- dplyr::select(df, ...)
  if (missing(...)) df_temp <- df

  if (type == "kategorialna") {
    final <- list(
      licznosc = df_temp |>
        lapply(function(x) {
          questionr::freq(x, cum = TRUE)
        })
    )
  }

  if (type == "porzadkowa") {
    final <- list(
      licznosc = df_temp |>
        lapply(function(x) {
          questionr::freq(x, cum = TRUE)
        }),
      opisowe = df_temp |>
        tidyr::pivot_longer(dplyr::everything(), names_to = "var", values_to = "val") |>
        dplyr::group_by(var) |>
        dplyr::summarise(dplyr::across(.fns = dplyr::lst(
          N = function(x) sum(!is.na(x)),
          Me = function(x) median(x, na.rm = TRUE),
          R = function(x) max(x) - min(x),
          RQ = function(x) quantile(x, 0.75) - quantile(x, 0.25),
          VQ = function(x) ((quantile(x, 0.75) - quantile(x, 0.25)) / 2) / median(x),
          VQ_interp = function(x) {
            VQ <- ((quantile(x, 0.75) - quantile(x, 0.25)) / 2) / median(x)
            dplyr::case_when(
              VQ >= 0.5 ~ "bardzo du\u017Ca",
              VQ >= 0.36 ~ "du\u017Ca",
              VQ >= 0.16 ~ "umiarkowana",
              VQ >= 0.1 ~ "s\u0142aba",
              VQ < 0.1 ~ "quasi-sta\u0142a"
            )
          },
          `NA` = function(x) sum(is.na(x))
        ), .names = "{.fn}"))
    )
  }

  if (type == "ilosciowa") {
    final <- list(
      opisowe = df_temp |>
        tidyr::pivot_longer(dplyr::everything(), names_to = "var", values_to = "val") |>
        dplyr::group_by(var) |>
        dplyr::summarise(dplyr::across(.fns = dplyr::lst(
          N = function(x) sum(!is.na(x)),
          M = function(x) mean(x, na.rm = TRUE),
          SD = function(x) sd(x, na.rm = TRUE),
          A = function(x) moments::skewness(x, na.rm = TRUE),
          K = function(x) moments::kurtosis(x, na.rm = TRUE),
          `NA` = function(x) sum(is.na(x))
        ), .names = "{.fn}")),
      test_shapiro_wilka = df_temp |> # test normalności Shapiro-Wilka
        tidyr::pivot_longer(dplyr::everything(), names_to = "var", values_to = "val") |>
        dplyr::group_by(var) |>
        rstatix::shapiro_test(val) |>
        dplyr::select(-variable) |>
        rstatix::add_significance()
    )
  }
  return(final)
}

#' @describeIn statystyki_opisowe Statystyki opisowe z grupowaniem
#' @param group kolumny ze zmienną grupującą. Podane jako nazwa, ciąg znaków lub wektor tychże.
#' @export
#' @examples
#' data(diamonds, package = "ggplot2")
#' # wiele kolumn do opisania
#' statystyki_opisowe_by(diamonds, "porzadkowa", group = clarity, price, carat)
#' statystyki_opisowe_by(diamonds, "kategorialna", c(cut, clarity), color)

statystyki_opisowe_by <- function(df, type = c("kategorialna", "porzadkowa", "ilosciowa"), group, ...) { # jw. tylko ze zmienną grupującą
  group <- vapply(substitute(group), deparse, "vector") # por. vector_to_char()
  if (length(group) > 1) group <- group[2:length(group)]
  split(df, df[group]) |>
    lapply(statystyki_opisowe, type, ...)
}
