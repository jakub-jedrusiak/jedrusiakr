#' Zmiana nazw w ciągi znaków
#'
#' Funkcje zmieniające nazwy w ciągi znaków, potencjalnie przydatne w
#' programowaniu. Zdejmują z użytkownika konieczność umieszczania wejścia w
#' cudzysłowach.
#'
#' @param name nazwa.
#' @param vctr_of_names wektor nazw. Może zawierać także ciągi znaków.
#'
#' @return Zwraca ciąg znaków lub nienazwany wektor ciągów znaków.
#'
#' @importFrom stringr str_remove_all
#'
vector_to_char <- function(vctr_of_names) {
  vctr_of_names <- vapply(substitute(vctr_of_names), deparse, "vector")
  if (length(vctr_of_names) > 1) vctr_of_names <- eval(vctr_of_names)[2:length(vctr_of_names)] # usuwa "c", które pojawia się jako pierwszy element wektora, jeśli podano więcej niż jedną nazwę
  vctr_of_names <- unname(vapply(vctr_of_names, stringr::str_remove_all, FUN.VALUE = "vector", "\"")) # usuwa cudzysłowy, dzięki czemu można mieszać w wektorze wejściowym nazwy i ciągi znaków, np. c("plec", wiek)
  return(vctr_of_names)
}

#' @describeIn vector_to_char Pojedyncza nazwa
#' @export
#' @examples
#' #' name_to_char(plec)
#'
name_to_char <- function(name) deparse(substitute(name))
