#' jedrusiakr: Utilities for Statistics in Psychology
#'
#' A set of tools for quick exploration and reporting. The main part consists of
#' functions used to calculate basic descriptive statistics and normality checks
#' (mainly `opisz()` and `opisz_by()`. The types of descriptives reported are
#' different for different types of measurement scales (nominal, ordinal and
#' continous). The package also includes a set of functions for autoreporting
#' (`raport_()`) that take a model and returns an example of analysis
#' description in Polish. For the time being, the package
#' and its documentation are written only in Polish.
#'
#' @docType package
#' @name jedrusiakr
#'
#' @import dplyr
#' @importFrom stats sd quantile median

"_PACKAGE"
utils::globalVariables(c("var", "val", "variable"))
