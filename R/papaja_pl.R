# wiodące zera i przecinki w papaja::apa_print()
adjust_reporting_style <- function(x) {
  stopifnot(inherits(x, "apa_results"))

  x$table |>
    dplyr::mutate(
      statistic = gsub("\\.", ",", statistic),
      p.value = gsub("\\.", "0,", p.value)
    ) |>
    (\(x) {
      glue_apa_results(
        x,
        est_glue = papaja:::construct_glue(x, "estimate"),
        stat_glue = papaja:::construct_glue(x, "statistic")
      )
    })()
}


apa_print_pl <- function(...) {
  papaja::apa_print(...) |>
    adjust_reporting_style()
}

print_p_pl <- function(x, digits = 3L, na_string = "", add_equals = FALSE) {
  validate(x,
    check_class = "numeric", check_range = c(0, 1),
    check_NA = FALSE
  )
  validate(digits, check_class = "numeric")
  apa_num(x, digits = digits, gt1 = TRUE, zero = FALSE, na_string = na_string, add_equals = add_equals, decimal.mark = ",", big.mark = " ")
}
