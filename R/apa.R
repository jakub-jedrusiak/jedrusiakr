#' APA printers
#'
#' @param test_result a result of a statistical test as returned by a function from the `rstatix` package. Currently supported are `t_test()`, `chisq_test()`.
#' @param pl if `TRUE` then polish format is used
#' @param anova_model an ANOVA model as returned by the `aov()` function
#' @param row_number row number of the ANOVA model to report
#'
#' @return a string with the APA formatted test result
#' @export
#'

apa <- function(test_result, pl = TRUE) {
  df <- round(test_result$df, 2)
  statistic <- round(test_result$statistic, 2)
  p <- round(test_result$p, 3)

  suppressWarnings({
    if (!is.null(test_result$n)) {
      n <- test_result$n
    }
  })

  if (pl) {
    df <- format_pl(df)
    statistic <- format_pl(statistic)
    p <- ifelse(p < 0.001, "p < 0,001", glue::glue("p = {format_pl(p)}"))
  } else {
    p <- ifelse(p < 0.001, "p < .001", glue::glue("p = {p}"))
  }

  string <- case_when(
    "chisq_test" %in% class(test_result) ~ glue::glue("$\\chi^2({df},\\ N = {n}) = {statistic}$; ${p}$"),
    "t_test" %in% class(test_result) ~ glue::glue("$t({df}) = {statistic}$; ${p}$"),
    .default = "ERROR"
  )

  if (string == "ERROR") {
    cli::cli_abort("Unknown test result class")
  }

  return(string)
}

#' @export

apa_aov <- function(anova_model, row_number = 1, pl = TRUE) {
  coeffs <- broom::tidy(anova_model)
  row <- coeffs %>%
    slice(row_number)
  df1 <- row %>%
    pull(df) %>%
    round(2)
  df2 <- coeffs %>%
    slice(nrow(coeffs)) %>%
    pull(df) %>%
    round(2)
  statistic <- row %>%
    pull(statistic) %>%
    round(2)
  p <- row %>%
    pull(p.value) %>%
    round(3)

  if (pl) {
    df1 <- format_pl(df1)
    df2 <- format_pl(df2)
    statistic <- format_pl(statistic)
    p <- ifelse(p < 0.001, "p < 0,001", glue::glue("p = {format_pl(p)}"))
  } else {
    p <- ifelse(p < 0.001, "p < .001", glue::glue("p = {p}"))
  }

  glue::glue("$F({df1},\ {df2}) = {statistic}$; ${p}$")
}
