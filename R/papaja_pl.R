#' Papaja po polsku
#'
#' Funkcje dostosowujące Papaję do polskich standardów APA.
#'
#' @import papaja
#' @inheritParams papaja::apa_num
#' @inheritParams papaja::print_p
#' @inheritDotParams base::formatC -x
#' @inheritDotParams papaja::apa_num
#' @param decimal.mark the character to be used to indicate the numeric decimal point.
#' @param big.mark character; if not empty used as mark between every big.interval decimals before (hence big) the decimal point.

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
  apa_num(x, digits = digits, gt1 = FALSE, zero = FALSE, na_string = na_string, add_equals = add_equals, decimal.mark = ",", big.mark = " ", drop0trailing = TRUE)
}

#' @describeIn papaja_pl Liczba
#' @export

apa_num_pl <- function(x, digits = 2L, gt1 = TRUE, zero = FALSE, na_string = "", decimal.mark = ",", big.mark = " ", add_equals = TRUE, ...) {
  apa_num(x, digits = digits, gt1 = gt1, zero = zero, na_string = na_string, add_equals = add_equals, decimal.mark = decimal.mark, big.mark = big.mark, drop0trailing = TRUE)
}
