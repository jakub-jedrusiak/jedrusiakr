test_that("correlation reporting works", {
  data(diamonds, package = "ggplot2")
  r <- cor.test(diamonds$carat, diamonds$price)
  result <- raport_cor(r, "masą a ceną brylantu")

  expected_result <- "Przeprowadzono analizę korelacji Pearsona między masą a ceną brylantu. Test wykazał istnienie istotnej, bardzo wysokiej, dodatniej korelacji między zmiennymi ($r = 0,92$; $p < 0,001$)."

  expect_equal(result, expected_result, ignore_attr = TRUE)
})

test_that("lm reporting works", {
  data(diamonds, package = "ggplot2")
  llm <- lm(price ~ carat, diamonds)
  result <- raport_lm(llm, "masą brylantu a jego ceną")

  expected_result <- "Celem sprawdzenia zależności między masą brylantu a jego ceną przeprowadzono analizę regresji. Model okazał się istotny statystycznie ($F(1, 53938) = 304 050,91$; $p < 0,001$) i wyjaśnia 85% wariancji."

  expect_equal(result, expected_result, ignore_attr = TRUE)
})

test_that("independent t-test reporting works", {
  library(dplyr)
  t <- iris %>%
    filter(Species %in% c("setosa", "versicolor")) %>%
    t.test(Petal.Length ~ Species, .)
  result <- raport_t(t, "długością płatków u różnych gatunków irysów")

  expected_result <- "Celem sprawdzenia istotności różnicy między długością płatków u różnych gatunków irysów wykonano test $t$-Studenta dla prób niezależnych. Test wykazał, że różnica w średnich ($ΔM = 2,8$) między grupami jest istotna statystycznie ($t(62,14) = 39,49$; $p < 0,001$)."

  expect_equal(result, expected_result, ignore_attr = TRUE)
})

test_that("dependent t-test reporting works", {
  library(dplyr)
  library(magrittr)
  t <- iris %$%
    t.test(Petal.Length, Petal.Width, paired = TRUE)
  result <- raport_t(t, "długością i szerokością płatków irysów")

  expected_result <- "Celem sprawdzenia istotności różnicy między długością i szerokością płatków irysów wykonano test $t$-Studenta dla prób zależnych. Test wykazał, że różnica w średnich ($ΔM = 2,56$) między zmiennymi jest istotna statystycznie ($t(149) = 29,8$; $p < 0,001$)."

  expect_equal(result, expected_result, ignore_attr = TRUE)
})

test_that("Mann-Whitney test reporting works", {
  library(dplyr)
  library(coin)
  U <- iris %>%
    filter(Species %in% c("setosa", "versicolor")) %>%
    wilcox_test(Sepal.Length ~ Species, .)
  result <- raport_U(U, "długością płatków u różnych gatunków irysów")

  expected_result <- "Celem sprawdzenia istotności różnicy między długością płatków u różnych gatunków irysów wykonano test $U$ Manna-Whitneya. Test wykazał, że różnica jest istotna statystycznie ($Z = 7,47$; $p < 0,001$)."

  expect_equal(result, expected_result, ignore_attr = TRUE)
})

test_that("MSD works as expected", {
  expect_equal(jedrusiakr::MSD(iris, Sepal.Length, Species == "setosa"), "$M = 5,01$; $SD = 0,35$")
})
