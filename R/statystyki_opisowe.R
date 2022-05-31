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
#' @importFrom agricolae skewness kurtosis
#' @importFrom rstatix add_significance shapiro_test
#' @importFrom tidyr pivot_longer
#' @importFrom forcats fct_drop
#' @import tidyselect
#'
#' @examples
#' statystyki_opisowe(iris, "ilosciowa", Sepal.Width)
#' statystyki_opisowe(iris, "ilosciowa", tidyselect:::where(is.numeric)) # z czasownikiem tidyselect
#'
statystyki_opisowe <- function(df, type = c("kategorialna", "porzadkowa", "ilosciowa"), ...) {
  if (!type %in% c("kategorialna", "porzadkowa", "ilosciowa")) stop("Skala mo\u017ce by\u0107 wy\u0142\u0105cznie \"kategorialna\", \"porzadkowa\" albo \"ilosciowa\".")

  if (!missing(...)) df_temp <- dplyr::select(df, ...)
  if (missing(...)) df_temp <- df

  df_temp <- mutate(df_temp, across(tidyselect:::where(is.factor), forcats::fct_drop))

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
          A = function(x) agricolae::skewness(x),
          K = function(x) agricolae::kurtosis(x),
          `NA` = function(x) sum(is.na(x))
        ), .names = "{.fn}")),
      test_shapiro_wilka = df_temp |>
        tidyr::pivot_longer(dplyr::everything(), names_to = "var", values_to = "val") |>
        dplyr::group_by(var) |>
        rstatix::shapiro_test(val) |>
        dplyr::select(-variable) |>
        rstatix::add_significance()
    )
  }
  return(final)
}

#' @describeIn statystyki_opisowe Statystyki opisowe z grupowaniem.
#' @param group kolumny ze zmienną grupującą. Podane jako nazwa, ciąg znaków lub wektor tychże.
#' @export
#' @examples
#' data(diamonds, package = "ggplot2")
#' # wiele kolumn do opisania
#' statystyki_opisowe_by(diamonds, "porzadkowa", group = clarity, price, carat)
#' statystyki_opisowe_by(diamonds, "kategorialna", c(cut, clarity), color)
#'
statystyki_opisowe_by <- function(df, type = c("kategorialna", "porzadkowa", "ilosciowa"), group, ...) {
  df <- mutate(df, across(tidyselect:::where(is.factor), forcats::fct_drop))
  group <- vapply(substitute(group), deparse, "vector") # por. vector_to_char()
  if (length(group) > 1) group <- group[2:length(group)]
  split(df, df[group]) |>
    lapply(statystyki_opisowe, type, ...)
}

#' @describeIn statystyki_opisowe Opisuje całą ramkę danych, użytkownik wskazuje zmienne danego typu.
#' @return Nazwana lista statystyk opisowych dla zmiennych każdego typu.
#' @export
#' @param kategorialne Wektor nazw zmiennych kategorialnych w ramce danych.
#' @param porzadkowe Wektor nazw zmiennych porządkowych w ramce danych.
#' @param ilosciowe Wektor nazw zmiennych ilościowych w ramce danych.
#' @examples
#' data(diamonds, package = "ggplot2")
#' opisz(head(diamonds), color, table, c(carat, price))
#'
opisz <- function(df, kategorialne, porzadkowe, ilosciowe) {
  ifelse(
    missing(kategorialne),
    wynik_kategorialne <- list(),
    wynik_kategorialne <- statystyki_opisowe(df = df, type = "kategorialna", {{ kategorialne }})
  )
  ifelse(
    missing(porzadkowe),
    wynik_porzadkowe <- list(),
    wynik_porzadkowe <- statystyki_opisowe(df = df, type = "porzadkowa", {{ porzadkowe }})
  )
  ifelse(
    missing(ilosciowe),
    wynik_kategorialne <- list(),
    wynik_ilosciowe <- statystyki_opisowe(df = df, type = "ilosciowa", {{ ilosciowe }})
  )
  list(
    kategorialne = wynik_kategorialne,
    porzadkowe = wynik_porzadkowe,
    ilosciowe = wynik_ilosciowe
  )
}

#' @describeIn statystyki_opisowe Opisuje całą ramkę danych ze zmienną grupującą, użytkownik wskazuje zmienne danego typu.
#' @return Nazwana lista statystyk opisowych dla zmiennych każdego typu.
#' @export
#' @param kategorialne Wektor nazw zmiennych kategorialnych w ramce danych.
#' @param porzadkowe Wektor nazw zmiennych porządkowych w ramce danych.
#' @param ilosciowe Wektor nazw zmiennych ilościowych w ramce danych.
#' @importFrom rlang !! enquo
#' @examples
#' data(diamonds, package = "ggplot2")
#' opisz_by(head(diamonds, 100), cut, color, table, c(carat, price))
#'
opisz_by <- function(df, group, kategorialne, porzadkowe, ilosciowe) {
  df <- mutate(df, across(tidyselect:::where(is.factor), forcats::fct_drop))
  group <- vapply(substitute(group), deparse, "vector") # por. vector_to_char()
  if (length(group) > 1) group <- group[2:length(group)]
  splitted <- split(df, df[group])

  ifelse(
    missing(kategorialne),
    wynik_kategorialne <- list(),
    wynik_kategorialne <- lapply(splitted, statystyki_opisowe, type = "kategorialna", !!enquo(kategorialne))
  )
  ifelse(
    missing(porzadkowe),
    wynik_porzadkowe <- list(),
    wynik_porzadkowe <- lapply(splitted, statystyki_opisowe, type = "porzadkowa", !!enquo(porzadkowe))
  )
  ifelse(
    missing(ilosciowe),
    wynik_kategorialne <- list(),
    wynik_ilosciowe <- lapply(splitted, statystyki_opisowe, type = "ilosciowa", !!enquo(ilosciowe))
  )
  list(
    kategorialne = wynik_kategorialne,
    porzadkowe = wynik_porzadkowe,
    ilosciowe = wynik_ilosciowe
  )
}
