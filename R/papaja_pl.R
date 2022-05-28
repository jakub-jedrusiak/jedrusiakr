#' Papaja po polsku
#'
#' Funkcje dostosowujące Papaję do polskich standardów APA.
#'
#' @import papaja
#' @inheritParams papaja::apa_num
#' @inheritDotParams base::formatC -x

# wiodące zera i przecinki w papaja::apa_print()
# adjust_reporting_style <- function(x) {
#   stopifnot(inherits(x, "apa_results"))
#
#   x$table |>
#     dplyr::mutate(
#       statistic = gsub("\\.", ",", statistic),
#       p.value = gsub("\\.", "0,", p.value)
#     ) |>
#     (\(x) {
#       glue_apa_results(
#         x,
#         est_glue = papaja:::construct_glue(x, "estimate"),
#         stat_glue = papaja:::construct_glue(x, "statistic")
#       )
#     })()
# }
#
#
# apa_print_pl <- function(...) {
#   papaja::apa_print(...) |>
#     adjust_reporting_style()
# }

#' @describeIn papaja_pl Wartość prawdopodobieństwa
#' @export

print_p_pl <- function(x, digits = 3L, na_string = "", add_equals = TRUE) {
  apa_num(x, digits = digits, gt1 = FALSE, zero = FALSE, na_string = na_string, add_equals = add_equals, decimal.mark = ",", big.mark = " ")
}

#' @describeIn papaja_pl Liczba
#' @export

apa_num_pl <- function(x, digits = 3L, gt1 = TRUE, zero = FALSE, na_string = "", add_equals = TRUE, decimal.mark = ",", big.mark = " ") {
  apa_num(x, digits = digits, gt1 = gt1, zero = zero, na_string = na_string, add_equals = add_equals, decimal.mark = ",", big.mark = " ")
}
