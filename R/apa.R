#' APA printers
#'
#' @param test_result a result of a statistical test as returned by a function from the `rstatix` package. Currently supported are `t_test()`, `chisq_test()`.
#' @param pl if `TRUE` then polish format is used
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
    p <- format_pl(p)
  }

  string <- case_when(
    "chisq_test" %in% class(test_result) ~ glue::glue("$\\chi^2({df},\\ N = {n}) = {statistic}$; $p = {p}$"),
    "t_test" %in% class(test_result) ~ glue::glue("$t({df}) = {statistic}$; $p = {p}$"),
    .default = "ERROR"
  )

  if (string == "ERROR") {
    cli::cli_abort("Unknown test result class")
  }

  return(string)
}
