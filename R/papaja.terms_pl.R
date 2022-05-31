#' papaja.terms_pl
#'
#' Tłumaczenia terminów z pakietu \link[papaja]{papaja} na polski i funkcja je aplikująca.
#' @import papaja
#' @export

papaja.terms_pl <- function() {
  terms_pl <- getOption("papaja.terms")

  terms_pl$author_note <- "O autorze"
  terms_pl$abstract <- "Abstrakt"
  terms_pl$keywords <- "S\u0142owa kluczowe"
  terms_pl$word_count <- "Liczba s\u0142\u00f3w"
  terms_pl$table <- "Tabela"
  terms_pl$figure <- "Rysunek"
  terms_pl$note <- "Adnotacja"
  terms_pl$correspondence <- "Korespondencja dotycz\u0105ca tego artyku\u0142u powinna by\u0107 skierowana do "
  terms_pl$email <- "Adres e-mail"

  options("papaja.terms" = terms_pl)
}
