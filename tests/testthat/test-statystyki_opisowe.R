test_that("statystyki_opisowe for kategorialna and statystyki_opisowe_by work", {
  data(diamonds, package = "ggplot2")
  result <- statystyki_opisowe_by(head(diamonds), "kategorialna", c(cut, clarity), color)

  expected_result <- list(Good.SI2 = list(licznosc = list(color = structure(list(
    n = 1,
    `%` = 100, `val%` = 100, `%cum` = 100, `val%cum` = 100
  ), row.names = "J", class = c(
    "freqtab",
    "data.frame"
  )))), `Very Good.SI2` = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), Premium.SI2 = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), Ideal.SI2 = list(licznosc = list(color = structure(list(
    n = 1, `%` = 100, `val%` = 100, `%cum` = 100, `val%cum` = 100
  ), row.names = "E", class = c(
    "freqtab",
    "data.frame"
  )))), Good.SI1 = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), `Very Good.SI1` = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), Premium.SI1 = list(licznosc = list(color = structure(list(
    n = 1, `%` = 100, `val%` = 100, `%cum` = 100, `val%cum` = 100
  ), row.names = "E", class = c(
    "freqtab",
    "data.frame"
  )))), Ideal.SI1 = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), Good.VS2 = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), `Very Good.VS2` = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), Premium.VS2 = list(licznosc = list(color = structure(list(
    n = 1, `%` = 100, `val%` = 100, `%cum` = 100, `val%cum` = 100
  ), row.names = "I", class = c(
    "freqtab",
    "data.frame"
  )))), Ideal.VS2 = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), Good.VS1 = list(licznosc = list(color = structure(list(
    n = 1, `%` = 100, `val%` = 100, `%cum` = 100, `val%cum` = 100
  ), row.names = "E", class = c(
    "freqtab",
    "data.frame"
  )))), `Very Good.VS1` = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), Premium.VS1 = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), Ideal.VS1 = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), Good.VVS2 = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), `Very Good.VVS2` = list(licznosc = list(color = structure(list(
    n = 1, `%` = 100, `val%` = 100, `%cum` = 100, `val%cum` = 100
  ), row.names = "J", class = c(
    "freqtab",
    "data.frame"
  )))), Premium.VVS2 = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))), Ideal.VVS2 = list(licznosc = list(color = structure(list(
    n = numeric(0), `%` = numeric(0), `val%` = numeric(0), `%cum` = numeric(0),
    `val%cum` = numeric(0)
  ), row.names = integer(0), class = c(
    "freqtab",
    "data.frame"
  )))))

  expect_equal(result, expected_result, ignore_attr = TRUE, tolerance = 0.5)
})

test_that("statystyki_opisowe for ilosciowa works", {
  library(dplyr)
  result <- iris %>%
    select(Sepal.Length) %>%
    statystyki_opisowe("ilosciowa")

  expected_result <- list(opisowe = structure(list(
    var = "Sepal.Length", N = 150L,
    M = 5.84333333333333, SD = 0.828066127977863, A = 0.314910956636973,
    K = -0.552064041315639, `NA` = 0L
  ), class = c(
    "tbl_df", "tbl",
    "data.frame"
  ), row.names = c(NA, -1L)), test_shapiro_wilka = structure(list(
    var = "Sepal.Length", statistic = c(W = 0.976090272240278),
    p = 0.0101811611756293, p.signif = "*"
  ), row.names = c(
    NA,
    -1L
  ), class = c("tbl_df", "tbl", "data.frame")))

  expect_equal(result, expected_result, ignore_attr = TRUE, tolerance = 0.5)
})

test_that("statystyki_opisowe for porzadkowa works", {
  result <- statystyki_opisowe(iris, "porzadkowa", Sepal.Length)

  expected_result <- list(licznosc = list(Sepal.Length = structure(list(n = c(
    1, 3,
    1, 4, 2, 5, 6, 10, 9, 4, 1, 6, 7, 6, 8, 7, 3, 6, 6, 4, 9, 7,
    5, 2, 8, 3, 4, 1, 1, 3, 1, 1, 1, 4, 1
  ), `%` = c(
    0.7, 2, 0.7,
    2.7, 1.3, 3.3, 4, 6.7, 6, 2.7, 0.7, 4, 4.7, 4, 5.3, 4.7, 2, 4,
    4, 2.7, 6, 4.7, 3.3, 1.3, 5.3, 2, 2.7, 0.7, 0.7, 2, 0.7, 0.7,
    0.7, 2.7, 0.7
  ), `val%` = c(
    0.7, 2, 0.7, 2.7, 1.3, 3.3, 4, 6.7,
    6, 2.7, 0.7, 4, 4.7, 4, 5.3, 4.7, 2, 4, 4, 2.7, 6, 4.7, 3.3,
    1.3, 5.3, 2, 2.7, 0.7, 0.7, 2, 0.7, 0.7, 0.7, 2.7, 0.7
  ), `%cum` = c(
    0.7,
    2.7, 3.3, 6, 7.3, 10.7, 14.7, 21.3, 27.3, 30, 30.7, 34.7, 39.3,
    43.3, 48.7, 53.3, 55.3, 59.3, 63.3, 66, 72, 76.7, 80, 81.3, 86.7,
    88.7, 91.3, 92, 92.7, 94.7, 95.3, 96, 96.7, 99.3, 100
  ), `val%cum` = c(
    0.7,
    2.7, 3.3, 6, 7.3, 10.7, 14.7, 21.3, 27.3, 30, 30.7, 34.7, 39.3,
    43.3, 48.7, 53.3, 55.3, 59.3, 63.3, 66, 72, 76.7, 80, 81.3, 86.7,
    88.7, 91.3, 92, 92.7, 94.7, 95.3, 96, 96.7, 99.3, 100
  )), row.names = c(
    "4.3",
    "4.4", "4.5", "4.6", "4.7", "4.8", "4.9", "5", "5.1", "5.2",
    "5.3", "5.4", "5.5", "5.6", "5.7", "5.8", "5.9", "6", "6.1",
    "6.2", "6.3", "6.4", "6.5", "6.6", "6.7", "6.8", "6.9", "7",
    "7.1", "7.2", "7.3", "7.4", "7.6", "7.7", "7.9"
  ), class = c(
    "freqtab",
    "data.frame"
  ))), opisowe = structure(list(
    var = "Sepal.Length",
    N = 150L, Me = 5.8, R = 3.6, RQ = c(`75%` = 1.3), VQ = c(`75%` = 0.112068965517241),
    VQ_interp = "słaba", `NA` = 0L
  ), class = c(
    "tbl_df", "tbl",
    "data.frame"
  ), row.names = c(NA, -1L)))

  expect_equal(result, expected_result, ignore_attr = TRUE, tolerance = 0.5)
})

test_that("statystyki_opisowe invalid type error works", {
  expect_error(statystyki_opisowe(iris, "other type", Sepal.Length))
})

test_that("opisz() works", {
  data(diamonds, package = "ggplot2")
  result <- opisz(head(diamonds), color, table, c(carat, price))

  expected_result <- list(kategorialne = list(licznosc = list(color = structure(list(
    n = c(3, 1, 2), `%` = c(50, 16.7, 33.3), `val%` = c(
      50, 16.7,
      33.3
    ), `%cum` = c(50, 66.7, 100), `val%cum` = c(
      50, 66.7,
      100
    )
  ), row.names = c("E", "I", "J"), class = c(
    "freqtab",
    "data.frame"
  )))), porzadkowe = list(licznosc = list(table = structure(list(
    n = c(1, 1, 2, 1, 1), `%` = c(16.7, 16.7, 33.3, 16.7, 16.7), `val%` = c(16.7, 16.7, 33.3, 16.7, 16.7), `%cum` = c(
      16.7,
      33.3, 66.7, 83.3, 100
    ), `val%cum` = c(
      16.7, 33.3, 66.7, 83.3,
      100
    )
  ), row.names = c("55", "57", "58", "61", "65"), class = c(
    "freqtab",
    "data.frame"
  ))), opisowe = structure(list(
    var = "table", N = 6L,
    Me = 58, R = 10, RQ = c(`75%` = 3), VQ = c(`75%` = 0.0258620689655172),
    VQ_interp = "quasi-stała", `NA` = 0L
  ), class = c(
    "tbl_df",
    "tbl", "data.frame"
  ), row.names = c(NA, -1L))), ilosciowe = list(
    opisowe = structure(list(var = c("carat", "price"), N = c(
      6L,
      6L
    ), M = c(0.251666666666667, 330.666666666667), SD = c(
      0.0392003401345788,
      4.80277697448743
    ), A = c(0.79960791866874, 0.047539933799705), K = c(-1.14779245345165, -3.07352400681613), `NA` = c(
      0L,
      0L
    )), class = c("tbl_df", "tbl", "data.frame"), row.names = c(
      NA,
      -2L
    )), test_shapiro_wilka = structure(list(var = c(
      "carat",
      "price"
    ), statistic = c(W = 0.87561912060703, W = 0.79473474038918), p = c(0.249536560294192, 0.0526727704745381), p.signif = c(
      "ns",
      "ns"
    )), row.names = c(NA, -2L), class = c(
      "tbl_df", "tbl",
      "data.frame"
    ))
  ))

  expect_equal(result, expected_result, ignore_attr = TRUE, tolerance = 0.5)
})

test_that("opisz_by() works", {
  data(diamonds, package = "ggplot2")
  result <- opisz_by(head(diamonds, 100), cut, color, table, c(carat, price))

  expected_result <- list(
    kategorialne = list(
      Fair = list(licznosc = list(color = structure(list(
        n = c(2, 1), `%` = c(66.7, 33.3), `val%` = c(66.7, 33.3),
        `%cum` = c(66.7, 100), `val%cum` = c(66.7, 100)
      ), row.names = c(
        "E",
        "F"
      ), class = c("freqtab", "data.frame")))), Good = list(licznosc = list(
        color = structure(list(n = c(2, 4, 2, 4, 2, 4), `%` = c(
          11.1,
          22.2, 11.1, 22.2, 11.1, 22.2
        ), `val%` = c(
          11.1, 22.2, 11.1,
          22.2, 11.1, 22.2
        ), `%cum` = c(
          11.1, 33.3, 44.4, 66.7, 77.8,
          100
        ), `val%cum` = c(11.1, 33.3, 44.4, 66.7, 77.8, 100)), row.names = c(
          "D",
          "E", "F", "H", "I", "J"
        ), class = c("freqtab", "data.frame"))
      )), `Very Good` = list(licznosc = list(color = structure(list(
        n = c(7, 9, 5, 3, 6, 3, 5), `%` = c(
          18.4, 23.7, 13.2, 7.9,
          15.8, 7.9, 13.2
        ), `val%` = c(
          18.4, 23.7, 13.2, 7.9, 15.8,
          7.9, 13.2
        ), `%cum` = c(
          18.4, 42.1, 55.3, 63.2, 78.9, 86.8,
          100
        ), `val%cum` = c(18.4, 42.1, 55.3, 63.2, 78.9, 86.8, 100)
      ), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c(
        "freqtab",
        "data.frame"
      )))), Premium = list(licznosc = list(color = structure(list(
        n = c(2, 5, 2, 2, 6, 4, 1), `%` = c(
          9.1, 22.7, 9.1, 9.1,
          27.3, 18.2, 4.5
        ), `val%` = c(
          9.1, 22.7, 9.1, 9.1, 27.3, 18.2,
          4.5
        ), `%cum` = c(9.1, 31.8, 40.9, 50, 77.3, 95.5, 100), `val%cum` = c(
          9.1,
          31.8, 40.9, 50, 77.3, 95.5, 100
        )
      ), row.names = c(
        "D", "E",
        "F", "G", "H", "I", "J"
      ), class = c("freqtab", "data.frame")))),
      Ideal = list(licznosc = list(color = structure(list(n = c(
        2,
        3, 3, 8, 3
      ), `%` = c(10.5, 15.8, 15.8, 42.1, 15.8), `val%` = c(
        10.5,
        15.8, 15.8, 42.1, 15.8
      ), `%cum` = c(
        10.5, 26.3, 42.1, 84.2,
        100
      ), `val%cum` = c(10.5, 26.3, 42.1, 84.2, 100)), row.names = c(
        "D",
        "E", "G", "I", "J"
      ), class = c("freqtab", "data.frame"))))
    ),
    porzadkowe = list(Fair = list(licznosc = list(table = structure(list(
      n = c(1, 1, 1), `%` = c(33.3, 33.3, 33.3), `val%` = c(
        33.3,
        33.3, 33.3
      ), `%cum` = c(33.3, 66.7, 100), `val%cum` = c(
        33.3,
        66.7, 100
      )
    ), row.names = c("61", "62", "69"), class = c(
      "freqtab",
      "data.frame"
    ))), opisowe = structure(list(
      var = "table",
      N = 3L, Me = 62, R = 8, RQ = c(`75%` = 4), VQ = c(`75%` = 0.032258064516129),
      VQ_interp = "quasi-stała", `NA` = 0L
    ), class = c(
      "tbl_df",
      "tbl", "data.frame"
    ), row.names = c(NA, -1L))), Good = list(
      licznosc = list(table = structure(list(n = c(
        2, 2, 5,
        1, 2, 2, 1, 1, 1, 1
      ), `%` = c(
        11.1, 11.1, 27.8, 5.6,
        11.1, 11.1, 5.6, 5.6, 5.6, 5.6
      ), `val%` = c(
        11.1, 11.1,
        27.8, 5.6, 11.1, 11.1, 5.6, 5.6, 5.6, 5.6
      ), `%cum` = c(
        11.1,
        22.2, 50, 55.6, 66.7, 77.8, 83.3, 88.9, 94.4, 100
      ), `val%cum` = c(
        11.1,
        22.2, 50, 55.6, 66.7, 77.8, 83.3, 88.9, 94.4, 100
      )), row.names = c(
        "54",
        "55", "56", "57", "58", "59", "60", "62", "63", "65"
      ), class = c(
        "freqtab",
        "data.frame"
      ))), opisowe = structure(list(
        var = "table",
        N = 18L, Me = 56.5, R = 11, RQ = c(`75%` = 3), VQ = c(`75%` = 0.0265486725663717),
        VQ_interp = "quasi-stała", `NA` = 0L
      ), class = c(
        "tbl_df",
        "tbl", "data.frame"
      ), row.names = c(NA, -1L))
    ), `Very Good` = list(
      licznosc = list(table = structure(list(n = c(
        1, 3, 2,
        11, 4, 6, 6, 3, 2
      ), `%` = c(
        2.6, 7.9, 5.3, 28.9, 10.5,
        15.8, 15.8, 7.9, 5.3
      ), `val%` = c(
        2.6, 7.9, 5.3, 28.9,
        10.5, 15.8, 15.8, 7.9, 5.3
      ), `%cum` = c(
        2.6, 10.5, 15.8,
        44.7, 55.3, 71.1, 86.8, 94.7, 100
      ), `val%cum` = c(
        2.6,
        10.5, 15.8, 44.7, 55.3, 71.1, 86.8, 94.7, 100
      )), row.names = c(
        "54",
        "55", "56", "57", "58", "59", "60", "61", "62"
      ), class = c(
        "freqtab",
        "data.frame"
      ))), opisowe = structure(list(
        var = "table",
        N = 38L, Me = 58, R = 8, RQ = c(`75%` = 3), VQ = c(`75%` = 0.0258620689655172),
        VQ_interp = "quasi-stała", `NA` = 0L
      ), class = c(
        "tbl_df",
        "tbl", "data.frame"
      ), row.names = c(NA, -1L))
    ), Premium = list(
      licznosc = list(table = structure(list(n = c(
        2, 10, 5,
        3, 2
      ), `%` = c(9.1, 45.5, 22.7, 13.6, 9.1), `val%` = c(
        9.1,
        45.5, 22.7, 13.6, 9.1
      ), `%cum` = c(
        9.1, 54.5, 77.3, 90.9,
        100
      ), `val%cum` = c(9.1, 54.5, 77.3, 90.9, 100)), row.names = c(
        "57",
        "58", "59", "61", "62"
      ), class = c("freqtab", "data.frame"))), opisowe = structure(list(
        var = "table", N = 22L,
        Me = 58, R = 5, RQ = c(`75%` = 1), VQ = c(`75%` = 0.00862068965517241),
        VQ_interp = "quasi-stała", `NA` = 0L
      ), class = c(
        "tbl_df",
        "tbl", "data.frame"
      ), row.names = c(NA, -1L))
    ), Ideal = list(
      licznosc = list(table = structure(list(n = c(
        3, 3, 1,
        7, 3, 1, 1
      ), `%` = c(
        15.8, 15.8, 5.3, 36.8, 15.8, 5.3,
        5.3
      ), `val%` = c(15.8, 15.8, 5.3, 36.8, 15.8, 5.3, 5.3), `%cum` = c(15.8, 31.6, 36.8, 73.7, 89.5, 94.7, 100), `val%cum` = c(
        15.8, 31.6, 36.8, 73.7, 89.5, 94.7,
        100
      )), row.names = c(
        "54", "55", "55.3", "56", "57",
        "58", "59"
      ), class = c("freqtab", "data.frame"))), opisowe = structure(list(
        var = "table", N = 19L, Me = 56, R = 5, RQ = c(`75%` = 1.5),
        VQ = c(`75%` = 0.0133928571428571), VQ_interp = "quasi-stała",
        `NA` = 0L
      ), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA, -1L))
    )), ilosciowe = list(Fair = list(
      opisowe = structure(list(var = c("carat", "price"), N = c(
        3L,
        3L
      ), M = c(0.68, 1951), SD = c(0.401497197997695, 1397.76535942196), A = c(-1.61195652922188, -1.73204681819718), K = c(
        NaN,
        NaN
      ), `NA` = c(0L, 0L)), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA, -2L)), test_shapiro_wilka = structure(list(
        var = c("carat", "price"), statistic = c(
          W = 0.849255583126551,
          W = 0.750619322451002
        ), p = c(0.23846127291196, 0.00136636629828201), p.signif = c("ns", "**")
      ), row.names = c(NA, -2L), class = c("tbl_df", "tbl", "data.frame"))
    ), Good = list(
      opisowe = structure(list(var = c("carat", "price"), N = c(
        18L,
        18L
      ), M = c(0.329444444444444, 661.277777777778), SD = c(
        0.138244124318167,
        765.773565484453
      ), A = c(2.44559550091808, 2.67120496811094), K = c(5.12606091527699, 5.85178584752777), `NA` = c(
        0L,
        0L
      )), class = c("tbl_df", "tbl", "data.frame"), row.names = c(
        NA,
        -2L
      )), test_shapiro_wilka = structure(list(
        var = c(
          "carat",
          "price"
        ), statistic = c(W = 0.573747545754471, W = 0.437645559303164), p = c(3.75788904857235e-06, 2.41206476043061e-07),
        p.signif = c("****", "****")
      ), row.names = c(
        NA,
        -2L
      ), class = c("tbl_df", "tbl", "data.frame"))
    ), `Very Good` = list(
      opisowe = structure(list(var = c("carat", "price"), N = c(
        38L,
        38L
      ), M = c(0.298421052631579, 610.210526315789), SD = c(
        0.134496585223194,
        642.879550649232
      ), A = c(3.01194041100671, 3.16074204588235), K = c(8.15407378138952, 8.66630104424168), `NA` = c(
        0L,
        0L
      )), class = c("tbl_df", "tbl", "data.frame"), row.names = c(
        NA,
        -2L
      )), test_shapiro_wilka = structure(list(
        var = c(
          "carat",
          "price"
        ), statistic = c(W = 0.494549642111908, W = 0.404552054388942), p = c(2.82294232819534e-10, 2.9990397774353e-11),
        p.signif = c("****", "****")
      ), row.names = c(
        NA,
        -2L
      ), class = c("tbl_df", "tbl", "data.frame"))
    ), Premium = list(
      opisowe = structure(list(var = c("carat", "price"), N = c(
        22L,
        22L
      ), M = c(0.293636363636364, 568.681818181818), SD = c(
        0.124117665161712,
        498.760214012957
      ), A = c(3.51653546442931, 4.40482941801487), K = c(14.2228840717044, 20.1647226583006), `NA` = c(
        0L,
        0L
      )), class = c("tbl_df", "tbl", "data.frame"), row.names = c(
        NA,
        -2L
      )), test_shapiro_wilka = structure(list(
        var = c(
          "carat",
          "price"
        ), statistic = c(W = 0.576809442538064, W = 0.373995759178409), p = c(7.54238609017048e-07, 1.04715478781297e-08),
        p.signif = c("****", "****")
      ), row.names = c(
        NA,
        -2L
      ), class = c("tbl_df", "tbl", "data.frame"))
    ), Ideal = list(
      opisowe = structure(list(var = c("carat", "price"), N = c(
        19L,
        19L
      ), M = c(0.342105263157895, 692.842105263158), SD = c(
        0.132395826863086,
        732.578646756927
      ), A = c(2.31061403944596, 2.72411131084888), K = c(4.85439212879616, 6.23959406020666), `NA` = c(
        0L,
        0L
      )), class = c("tbl_df", "tbl", "data.frame"), row.names = c(
        NA,
        -2L
      )), test_shapiro_wilka = structure(list(
        var = c(
          "carat",
          "price"
        ), statistic = c(W = 0.646411681403112, W = 0.464620566340876), p = c(1.36484080505897e-05, 2.47561032589644e-07),
        p.signif = c("****", "****")
      ), row.names = c(
        NA,
        -2L
      ), class = c("tbl_df", "tbl", "data.frame"))
    ))
  )

  expect_equal(result, expected_result, ignore_attr = TRUE, tolerance = 0.5)
})
