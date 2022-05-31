test_that("papaja.terms_pl() modify options", {
  library(papaja)
  test_option <- getOption("papaja.terms")

  test_option$author_note <- "O autorze"
  test_option$abstract <- "Abstrakt"
  test_option$keywords <- "Słowa kluczowe"
  test_option$word_count <- "Liczba słów"
  test_option$table <- "Tabela"
  test_option$figure <- "Rysunek"
  test_option$note <- "Adnotacja"
  test_option$correspondence <- "Korespondencja dotycząca tego artykułu powinna być skierowana do "
  test_option$email <- "Adres e-mail"

  papaja.terms_pl()

  expect_equal(getOption("papaja.terms"), test_option)
})
