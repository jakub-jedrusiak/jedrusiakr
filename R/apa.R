#' APA printers
#'
#' @param test_result a result of a statistical test as returned by a function from the `rstatix` package. Currently supported are `t_test()`, `chisq_test()`.
#' @param pl if `TRUE` then polish format is used
#' @param model a model object
#' @param row_number row number of the ANOVA model to report
#' @param adj_r_sq if `TRUE` then adjusted R-squared is reported
#'
#' @return a string with the APA formatted test result
#' @export
#'

apa <- function(test_result, pl = TRUE) {
  if ("cohens_d" %in% class(test_result)) {
    return(apa_d(test_result, pl))
  }

  suppressWarnings({
  df <- round(test_result$df, 2)
  statistic <- round(test_result$statistic, 2)
  p <- round(test_result$p, 3)
  n <- ifelse(is.null(test_result$n), NA, test_result$n)
  })

  if (pl) {
    df <- format_pl(df)
    statistic <- format_pl(statistic)
    p <- ifelse(p < 0.001, "p < 0,001", glue::glue("p = {format_pl(p)}"))
  } else {
    p <- ifelse(p < 0.001, "p < .001", glue::glue("p = {p}"))
  }

  string <- case_when(
    "t_test" %in% class(test_result) ~ glue::glue("$t({df}) = {statistic}$; ${p}$"),
    "chisq_test" %in% class(test_result) ~ glue::glue("$\\chi^2({df},\\ N = {n}) = {statistic}$; ${p}$"),
    .default = "ERROR"
  )

  if (string == "ERROR") {
    cli::cli_abort("Unknown test result class")
  }

  return(string)
}

#' @title Report ANOVA
#' @description Report ANOVA model parameters
#' @export

apa_aov <- function(model, row_number = 1, pl = TRUE) {
  coeffs <- broom::tidy(model)
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

  glue::glue("$F({df1},\\ {df2}) = {statistic}$; ${p}$")
}

#' @export

apa_lm <- function(model, adj_r_sq = TRUE, pl = TRUE) {
  coeffs <- broom::glance(model)
  df1 <- round(coeffs$df, 2)
  df2 <- round(coeffs$df.residual, 2)
  statistic <- round(coeffs$statistic, 2)
  p <- round(coeffs$p.value, 3)
  if (adj_r_sq) {
    R2 <- round(coeffs$adj.r.squared, 3)
  } else {
    R2 <- round(coeffs$r.squared, 3)
  }

  if (pl) {
    df1 <- format_pl(df1)
    df2 <- format_pl(df2)
    statistic <- format_pl(statistic)
    p <- ifelse(p < 0.001, "p < 0,001", glue::glue("p = {format_pl(p)}"))
    R2 <- format_pl(R2)
    adj <- "koryg."
  } else {
    p <- ifelse(p < 0.001, "p < .001", glue::glue("p = {p}"))
    adj <- "adj."
  }

  if (adj_r_sq) {
    glue::glue("$F({df1},\\ {df2}) = {statistic}$; ${p}$; $R^2_{{{adj}}} = {R2}$")
  } else {
    glue::glue("$F({df1},\\ {df2}) = {statistic}$; ${p}$; $R^2 = {R2}$")
  }
}

apa_d <- function(test_result, pl = TRUE) {
  effsize <- test_result$effsize

  small <- effsize < 0.001
  if (pl) effsize <- format_pl(effsize)

  if (small & pl) {
    return("d < 0,001")
  } else if (small & !pl) {
    return("d < .001")
  } else {
    return(glue::glue("$d = {effsize}$"))
  }
}
