
<!-- README.md is generated from README.Rmd. Please edit that file -->

# jedrusiakr: Utilities for Statistics in Psychology

<!-- badges: start -->

[![R-CMD-check](https://github.com/jakub-jedrusiak/jedrusiakr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jakub-jedrusiak/jedrusiakr/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/jakub-jedrusiak/jedrusiakr/branch/master/graph/badge.svg)](https://app.codecov.io/gh/jakub-jedrusiak/jedrusiakr?branch=master)
<!-- badges: end -->

A set of tools for quick exploration and reporting. The main part
consists of functions used to calculate basic descriptive statistics and
normality checks (mainly `opisz()` and `opisz_by()`). The types of
descriptives reported are different for different types of measurement
scales (nominal, ordinal and continous). The package also includes a set
of functions for autoreporting (`raport_()`) that take a model and
returns an example of analysis description in Polish (see *Example*
below). For the time being, the package and its documentation are
written only in Polish.

## Installation

You can install the development version of jedrusiakr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jakub-jedrusiak/jedrusiakr")
```

## Example

Summary statistics:

``` r
library(jedrusiakr)
statystyki_opisowe_by(iris, "ilosciowa", Species, where(is.numeric))
#> $setosa
#> $setosa$opisowe
#> # A tibble: 4 × 7
#>   var              N     M    SD      A      K  `NA`
#>   <chr>        <int> <dbl> <dbl>  <dbl>  <dbl> <int>
#> 1 Petal.Length    50 1.46  0.174 0.106   1.02      0
#> 2 Petal.Width     50 0.246 0.105 1.25    1.72      0
#> 3 Sepal.Length    50 5.01  0.352 0.120  -0.253     0
#> 4 Sepal.Width     50 3.43  0.379 0.0412  0.955     0
#> 
#> $setosa$test_shapiro_wilka
#> # A tibble: 4 × 4
#>   var          statistic           p p.signif
#>   <chr>            <dbl>       <dbl> <chr>   
#> 1 Petal.Length     0.955 0.0548      ns      
#> 2 Petal.Width      0.800 0.000000866 ****    
#> 3 Sepal.Length     0.978 0.460       ns      
#> 4 Sepal.Width      0.972 0.272       ns      
#> 
#> 
#> $versicolor
#> $versicolor$opisowe
#> # A tibble: 4 × 7
#>   var              N     M    SD       A       K  `NA`
#>   <chr>        <int> <dbl> <dbl>   <dbl>   <dbl> <int>
#> 1 Petal.Length    50  4.26 0.470 -0.607   0.0479     0
#> 2 Petal.Width     50  1.33 0.198 -0.0312 -0.410      0
#> 3 Sepal.Length    50  5.94 0.516  0.105  -0.533      0
#> 4 Sepal.Width     50  2.77 0.314 -0.363  -0.366      0
#> 
#> $versicolor$test_shapiro_wilka
#> # A tibble: 4 × 4
#>   var          statistic      p p.signif
#>   <chr>            <dbl>  <dbl> <chr>   
#> 1 Petal.Length     0.966 0.158  ns      
#> 2 Petal.Width      0.948 0.0273 *       
#> 3 Sepal.Length     0.978 0.465  ns      
#> 4 Sepal.Width      0.974 0.338  ns      
#> 
#> 
#> $virginica
#> $virginica$opisowe
#> # A tibble: 4 × 7
#>   var              N     M    SD      A       K  `NA`
#>   <chr>        <int> <dbl> <dbl>  <dbl>   <dbl> <int>
#> 1 Petal.Length    50  5.55 0.552  0.549 -0.154      0
#> 2 Petal.Width     50  2.03 0.275 -0.129 -0.602      0
#> 3 Sepal.Length    50  6.59 0.636  0.118  0.0329     0
#> 4 Sepal.Width     50  2.97 0.322  0.366  0.706      0
#> 
#> $virginica$test_shapiro_wilka
#> # A tibble: 4 × 4
#>   var          statistic      p p.signif
#>   <chr>            <dbl>  <dbl> <chr>   
#> 1 Petal.Length     0.962 0.110  ns      
#> 2 Petal.Width      0.960 0.0870 ns      
#> 3 Sepal.Length     0.971 0.258  ns      
#> 4 Sepal.Width      0.967 0.181  ns
```

Autoreporting in Polish:

``` r
library(jedrusiakr)
library(dplyr)
model <- iris %>%
  filter(Species %in% c("setosa", "versicolor")) %>%
  t.test(Petal.Length ~ Species, .)
raport_t(model, "długością płatków u różnych gatunków irysów")
#> [1] "Celem sprawdzenia istotności różnicy między długością płatków u różnych gatunków irysów wykonano test $t$-Studenta dla prób niezależnych. Test wykazał, że różnica w średnich ($ΔM = 2,8$) między grupami jest istotna statystycznie ($t(62,14) = 39,49$; $p < 0,001$)."
```
