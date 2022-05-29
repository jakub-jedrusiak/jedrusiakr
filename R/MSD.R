#' Raportowanie średniej i SD
#'
#' Prosta funkcja drukująca w średnią i SD między znakami dolara. Przydatna do
#' raportowania niektórych testów.
#'
#' @param df \code{\link[base]{data.frame}} lub \code{\link[tibble]{tibble}}
#' @param var nazwa zmiennej do opisania, bez cudzysłowu
#' @param ... opcjonalne argumenty przekazywane do funkcji \code{\link[dplyr]{filter}}
#'
#' @return Ciąg znaków zgodny z przykładem:
#' "$M = 5,01$; $SD = 0,35$"
#' @export
#'
#' @importFrom dplyr filter
#'
#' @examples
#' MSD(iris, Sepal.Length)
#' MSD(iris, Sepal.Length, Species == "setosa")
#' \dontrun{
#' MSD(iris, "Sepal.Length", Species == "setosa") # kolumna nie może być w cudzysłowie
#' }
MSD <- function(df, var, ...) {
  var <- deparse(substitute(var))
  if (!missing(...)) df <- filter(df, ...)
  M <- mean(df[[var]])
  SD <- sd(df[[var]])
  paste0("$M ", apa_num_pl(M), "$; $SD ", apa_num_pl(SD), "$")
}
