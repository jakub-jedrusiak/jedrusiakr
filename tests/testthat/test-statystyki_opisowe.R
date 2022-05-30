test_that("statystyki_opisowe for kategorialna and statystyki_opisowe_by work", {
  data(diamonds, package = "ggplot2")
  result <- statystyki_opisowe_by(diamonds, "kategorialna", c(cut, clarity), color)

  expected_result <- list(
    Fair.I1 = list(licznosc = list(color = structure(list(n = c(
      4,
      9, 35, 53, 52, 34, 23
    ), `%` = c(
      1.9, 4.3, 16.7, 25.2, 24.8, 16.2,
      11
    ), `val%` = c(1.9, 4.3, 16.7, 25.2, 24.8, 16.2, 11), `%cum` = c(
      1.9,
      6.2, 22.9, 48.1, 72.9, 89, 100
    ), `val%cum` = c(
      1.9, 6.2, 22.9,
      48.1, 72.9, 89, 100
    )), row.names = c(
      "D", "E", "F", "G", "H",
      "I", "J"
    ), class = c("freqtab", "data.frame")))), Good.I1 = list(
      licznosc = list(color = structure(list(
        n = c(
          8, 23, 19, 19,
          14, 9, 4
        ), `%` = c(8.3, 24, 19.8, 19.8, 14.6, 9.4, 4.2),
        `val%` = c(8.3, 24, 19.8, 19.8, 14.6, 9.4, 4.2), `%cum` = c(
          8.3,
          32.3, 52.1, 71.9, 86.5, 95.8, 100
        ), `val%cum` = c(
          8.3,
          32.3, 52.1, 71.9, 86.5, 95.8, 100
        )
      ), row.names = c(
        "D",
        "E", "F", "G", "H", "I", "J"
      ), class = c("freqtab", "data.frame")))
    ), `Very Good.I1` = list(licznosc = list(color = structure(list(
      n = c(5, 22, 13, 16, 12, 8, 8), `%` = c(
        6, 26.2, 15.5, 19,
        14.3, 9.5, 9.5
      ), `val%` = c(
        6, 26.2, 15.5, 19, 14.3, 9.5,
        9.5
      ), `%cum` = c(6, 32.1, 47.6, 66.7, 81, 90.5, 100), `val%cum` = c(
        6,
        32.1, 47.6, 66.7, 81, 90.5, 100
      )
    ), row.names = c(
      "D", "E",
      "F", "G", "H", "I", "J"
    ), class = c("freqtab", "data.frame")))),
    Premium.I1 = list(licznosc = list(color = structure(list(
      n = c(12, 30, 34, 46, 46, 24, 13), `%` = c(
        5.9, 14.6,
        16.6, 22.4, 22.4, 11.7, 6.3
      ), `val%` = c(
        5.9, 14.6, 16.6,
        22.4, 22.4, 11.7, 6.3
      ), `%cum` = c(
        5.9, 20.5, 37.1, 59.5,
        82, 93.7, 100
      ), `val%cum` = c(
        5.9, 20.5, 37.1, 59.5,
        82, 93.7, 100
      )
    ), row.names = c(
      "D", "E", "F", "G", "H",
      "I", "J"
    ), class = c("freqtab", "data.frame")))), Ideal.I1 = list(
      licznosc = list(color = structure(list(n = c(
        13, 18,
        42, 16, 38, 17, 2
      ), `%` = c(
        8.9, 12.3, 28.8, 11, 26,
        11.6, 1.4
      ), `val%` = c(
        8.9, 12.3, 28.8, 11, 26, 11.6,
        1.4
      ), `%cum` = c(8.9, 21.2, 50, 61, 87, 98.6, 100), `val%cum` = c(
        8.9,
        21.2, 50, 61, 87, 98.6, 100
      )), row.names = c(
        "D", "E",
        "F", "G", "H", "I", "J"
      ), class = c("freqtab", "data.frame")))
    ), Fair.SI2 = list(licznosc = list(color = structure(list(
      n = c(56, 78, 89, 80, 91, 45, 27), `%` = c(
        12, 16.7,
        19.1, 17.2, 19.5, 9.7, 5.8
      ), `val%` = c(
        12, 16.7, 19.1,
        17.2, 19.5, 9.7, 5.8
      ), `%cum` = c(
        12, 28.8, 47.9, 65,
        84.5, 94.2, 100
      ), `val%cum` = c(
        12, 28.8, 47.9, 65, 84.5,
        94.2, 100
      )
    ), row.names = c(
      "D", "E", "F", "G", "H", "I",
      "J"
    ), class = c("freqtab", "data.frame")))), Good.SI2 = list(
      licznosc = list(color = structure(list(n = c(
        223, 202,
        201, 163, 158, 81, 53
      ), `%` = c(
        20.6, 18.7, 18.6, 15.1,
        14.6, 7.5, 4.9
      ), `val%` = c(
        20.6, 18.7, 18.6, 15.1, 14.6,
        7.5, 4.9
      ), `%cum` = c(
        20.6, 39.3, 57.9, 73, 87.6, 95.1,
        100
      ), `val%cum` = c(
        20.6, 39.3, 57.9, 73, 87.6, 95.1,
        100
      )), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c("freqtab", "data.frame")))
    ), `Very Good.SI2` = list(
      licznosc = list(color = structure(list(n = c(
        314, 445,
        343, 327, 343, 200, 128
      ), `%` = c(
        15, 21.2, 16.3, 15.6,
        16.3, 9.5, 6.1
      ), `val%` = c(
        15, 21.2, 16.3, 15.6, 16.3,
        9.5, 6.1
      ), `%cum` = c(
        15, 36.1, 52.5, 68, 84.4, 93.9,
        100
      ), `val%cum` = c(15, 36.1, 52.5, 68, 84.4, 93.9, 100)), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c(
        "freqtab",
        "data.frame"
      )))
    ), Premium.SI2 = list(licznosc = list(
      color = structure(list(n = c(
        421, 519, 523, 492, 521,
        312, 161
      ), `%` = c(
        14.3, 17.6, 17.7, 16.7, 17.7, 10.6,
        5.5
      ), `val%` = c(
        14.3, 17.6, 17.7, 16.7, 17.7, 10.6,
        5.5
      ), `%cum` = c(14.3, 31.9, 49.6, 66.3, 84, 94.5, 100), `val%cum` = c(14.3, 31.9, 49.6, 66.3, 84, 94.5, 100)), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c(
        "freqtab",
        "data.frame"
      ))
    )), Ideal.SI2 = list(licznosc = list(color = structure(list(
      n = c(356, 469, 453, 486, 450, 274, 110), `%` = c(
        13.7,
        18.1, 17.4, 18.7, 17.3, 10.5, 4.2
      ), `val%` = c(
        13.7,
        18.1, 17.4, 18.7, 17.3, 10.5, 4.2
      ), `%cum` = c(
        13.7,
        31.8, 49.2, 67.9, 85.2, 95.8, 100
      ), `val%cum` = c(
        13.7,
        31.8, 49.2, 67.9, 85.2, 95.8, 100
      )
    ), row.names = c(
      "D",
      "E", "F", "G", "H", "I", "J"
    ), class = c("freqtab", "data.frame")))), Fair.SI1 = list(licznosc = list(color = structure(list(
      n = c(58, 65, 83, 69, 75, 30, 28), `%` = c(
        14.2, 15.9,
        20.3, 16.9, 18.4, 7.4, 6.9
      ), `val%` = c(
        14.2, 15.9, 20.3,
        16.9, 18.4, 7.4, 6.9
      ), `%cum` = c(
        14.2, 30.1, 50.5, 67.4,
        85.8, 93.1, 100
      ), `val%cum` = c(
        14.2, 30.1, 50.5, 67.4,
        85.8, 93.1, 100
      )
    ), row.names = c(
      "D", "E", "F", "G",
      "H", "I", "J"
    ), class = c("freqtab", "data.frame")))), Good.SI1 = list(
      licznosc = list(color = structure(list(n = c(
        237, 355,
        273, 207, 235, 165, 88
      ), `%` = c(
        15.2, 22.8, 17.5, 13.3,
        15.1, 10.6, 5.6
      ), `val%` = c(
        15.2, 22.8, 17.5, 13.3,
        15.1, 10.6, 5.6
      ), `%cum` = c(
        15.2, 37.9, 55.4, 68.7,
        83.8, 94.4, 100
      ), `val%cum` = c(
        15.2, 37.9, 55.4, 68.7,
        83.8, 94.4, 100
      )), row.names = c(
        "D", "E", "F", "G",
        "H", "I", "J"
      ), class = c("freqtab", "data.frame")))
    ),
    `Very Good.SI1` = list(licznosc = list(color = structure(list(
      n = c(494, 626, 559, 474, 547, 358, 182), `%` = c(
        15.2,
        19.3, 17.3, 14.6, 16.9, 11, 5.6
      ), `val%` = c(
        15.2, 19.3,
        17.3, 14.6, 16.9, 11, 5.6
      ), `%cum` = c(
        15.2, 34.6, 51.8,
        66.5, 83.3, 94.4, 100
      ), `val%cum` = c(
        15.2, 34.6, 51.8,
        66.5, 83.3, 94.4, 100
      )
    ), row.names = c(
      "D", "E", "F",
      "G", "H", "I", "J"
    ), class = c("freqtab", "data.frame")))),
    Premium.SI1 = list(licznosc = list(color = structure(list(
      n = c(556, 614, 608, 566, 655, 367, 209), `%` = c(
        15.6,
        17.2, 17, 15.8, 18.3, 10.3, 5.8
      ), `val%` = c(
        15.6, 17.2,
        17, 15.8, 18.3, 10.3, 5.8
      ), `%cum` = c(
        15.6, 32.7, 49.7,
        65.6, 83.9, 94.2, 100
      ), `val%cum` = c(
        15.6, 32.7, 49.7,
        65.6, 83.9, 94.2, 100
      )
    ), row.names = c(
      "D", "E", "F",
      "G", "H", "I", "J"
    ), class = c("freqtab", "data.frame")))),
    Ideal.SI1 = list(licznosc = list(color = structure(list(n = c(
      738,
      766, 608, 660, 763, 504, 243
    ), `%` = c(
      17.2, 17.9, 14.2,
      15.4, 17.8, 11.8, 5.7
    ), `val%` = c(
      17.2, 17.9, 14.2, 15.4,
      17.8, 11.8, 5.7
    ), `%cum` = c(
      17.2, 35.1, 49.3, 64.7, 82.6,
      94.3, 100
    ), `val%cum` = c(
      17.2, 35.1, 49.3, 64.7, 82.6, 94.3,
      100
    )), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c(
      "freqtab",
      "data.frame"
    )))), Fair.VS2 = list(licznosc = list(color = structure(list(
      n = c(25, 42, 53, 45, 41, 32, 23), `%` = c(
        9.6, 16.1,
        20.3, 17.2, 15.7, 12.3, 8.8
      ), `val%` = c(
        9.6, 16.1, 20.3,
        17.2, 15.7, 12.3, 8.8
      ), `%cum` = c(
        9.6, 25.7, 46, 63.2,
        78.9, 91.2, 100
      ), `val%cum` = c(
        9.6, 25.7, 46, 63.2,
        78.9, 91.2, 100
      )
    ), row.names = c(
      "D", "E", "F", "G",
      "H", "I", "J"
    ), class = c("freqtab", "data.frame")))), Good.VS2 = list(
      licznosc = list(color = structure(list(n = c(
        104, 160,
        184, 192, 138, 110, 90
      ), `%` = c(
        10.6, 16.4, 18.8, 19.6,
        14.1, 11.2, 9.2
      ), `val%` = c(
        10.6, 16.4, 18.8, 19.6,
        14.1, 11.2, 9.2
      ), `%cum` = c(
        10.6, 27, 45.8, 65.4, 79.6,
        90.8, 100
      ), `val%cum` = c(
        10.6, 27, 45.8, 65.4, 79.6,
        90.8, 100
      )), row.names = c(
        "D", "E", "F", "G", "H", "I",
        "J"
      ), class = c("freqtab", "data.frame")))
    ), `Very Good.VS2` = list(
      licznosc = list(color = structure(list(n = c(
        309, 503,
        466, 479, 376, 274, 184
      ), `%` = c(
        11.9, 19.4, 18, 18.5,
        14.5, 10.6, 7.1
      ), `val%` = c(
        11.9, 19.4, 18, 18.5, 14.5,
        10.6, 7.1
      ), `%cum` = c(
        11.9, 31.3, 49.3, 67.8, 82.3,
        92.9, 100
      ), `val%cum` = c(
        11.9, 31.3, 49.3, 67.8, 82.3,
        92.9, 100
      )), row.names = c(
        "D", "E", "F", "G", "H", "I",
        "J"
      ), class = c("freqtab", "data.frame")))
    ), Premium.VS2 = list(
      licznosc = list(color = structure(list(n = c(
        339, 629,
        619, 721, 532, 315, 202
      ), `%` = c(
        10.1, 18.7, 18.4, 21.5,
        15.8, 9.4, 6
      ), `val%` = c(
        10.1, 18.7, 18.4, 21.5, 15.8,
        9.4, 6
      ), `%cum` = c(
        10.1, 28.8, 47.3, 68.8, 84.6, 94,
        100
      ), `val%cum` = c(
        10.1, 28.8, 47.3, 68.8, 84.6, 94,
        100
      )), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c("freqtab", "data.frame")))
    ), Ideal.VS2 = list(
      licznosc = list(color = structure(list(n = c(
        920, 1136,
        879, 910, 556, 438, 232
      ), `%` = c(
        18.1, 22.4, 17.3, 17.9,
        11, 8.6, 4.6
      ), `val%` = c(
        18.1, 22.4, 17.3, 17.9, 11,
        8.6, 4.6
      ), `%cum` = c(
        18.1, 40.5, 57.9, 75.8, 86.8, 95.4,
        100
      ), `val%cum` = c(
        18.1, 40.5, 57.9, 75.8, 86.8, 95.4,
        100
      )), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c("freqtab", "data.frame")))
    ), Fair.VS1 = list(
      licznosc = list(color = structure(list(n = c(
        5, 14, 33,
        45, 32, 25, 16
      ), `%` = c(
        2.9, 8.2, 19.4, 26.5, 18.8,
        14.7, 9.4
      ), `val%` = c(
        2.9, 8.2, 19.4, 26.5, 18.8, 14.7,
        9.4
      ), `%cum` = c(2.9, 11.2, 30.6, 57.1, 75.9, 90.6, 100), `val%cum` = c(2.9, 11.2, 30.6, 57.1, 75.9, 90.6, 100)), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c(
        "freqtab",
        "data.frame"
      )))
    ), Good.VS1 = list(licznosc = list(color = structure(list(
      n = c(43, 89, 132, 152, 77, 103, 52), `%` = c(
        6.6, 13.7,
        20.4, 23.5, 11.9, 15.9, 8
      ), `val%` = c(
        6.6, 13.7, 20.4,
        23.5, 11.9, 15.9, 8
      ), `%cum` = c(
        6.6, 20.4, 40.7, 64.2,
        76.1, 92, 100
      ), `val%cum` = c(
        6.6, 20.4, 40.7, 64.2,
        76.1, 92, 100
      )
    ), row.names = c(
      "D", "E", "F", "G", "H",
      "I", "J"
    ), class = c("freqtab", "data.frame")))), `Very Good.VS1` = list(
      licznosc = list(color = structure(list(n = c(
        175, 293,
        293, 432, 257, 205, 120
      ), `%` = c(
        9.9, 16.5, 16.5, 24.3,
        14.5, 11.5, 6.8
      ), `val%` = c(
        9.9, 16.5, 16.5, 24.3, 14.5,
        11.5, 6.8
      ), `%cum` = c(
        9.9, 26.4, 42.9, 67.2, 81.7, 93.2,
        100
      ), `val%cum` = c(
        9.9, 26.4, 42.9, 67.2, 81.7, 93.2,
        100
      )), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c("freqtab", "data.frame")))
    ), Premium.VS1 = list(
      licznosc = list(color = structure(list(n = c(
        131, 292,
        290, 566, 336, 221, 153
      ), `%` = c(
        6.6, 14.7, 14.6, 28.5,
        16.9, 11.1, 7.7
      ), `val%` = c(
        6.6, 14.7, 14.6, 28.5, 16.9,
        11.1, 7.7
      ), `%cum` = c(
        6.6, 21.3, 35.8, 64.3, 81.2, 92.3,
        100
      ), `val%cum` = c(
        6.6, 21.3, 35.8, 64.3, 81.2, 92.3,
        100
      )), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c("freqtab", "data.frame")))
    ), Ideal.VS1 = list(
      licznosc = list(color = structure(list(n = c(
        351, 593,
        616, 953, 467, 408, 201
      ), `%` = c(
        9.8, 16.5, 17.2, 26.6,
        13, 11.4, 5.6
      ), `val%` = c(
        9.8, 16.5, 17.2, 26.6, 13,
        11.4, 5.6
      ), `%cum` = c(
        9.8, 26.3, 43.5, 70, 83, 94.4,
        100
      ), `val%cum` = c(9.8, 26.3, 43.5, 70, 83, 94.4, 100)), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c(
        "freqtab",
        "data.frame"
      )))
    ), Fair.VVS2 = list(licznosc = list(color = structure(list(
      n = c(9, 13, 10, 17, 11, 8, 1), `%` = c(
        13, 18.8, 14.5,
        24.6, 15.9, 11.6, 1.4
      ), `val%` = c(
        13, 18.8, 14.5, 24.6,
        15.9, 11.6, 1.4
      ), `%cum` = c(
        13, 31.9, 46.4, 71, 87,
        98.6, 100
      ), `val%cum` = c(
        13, 31.9, 46.4, 71, 87, 98.6,
        100
      )
    ), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c("freqtab", "data.frame")))), Good.VVS2 = list(
      licznosc = list(color = structure(list(n = c(
        25, 52,
        50, 75, 45, 26, 13
      ), `%` = c(
        8.7, 18.2, 17.5, 26.2, 15.7,
        9.1, 4.5
      ), `val%` = c(
        8.7, 18.2, 17.5, 26.2, 15.7, 9.1,
        4.5
      ), `%cum` = c(8.7, 26.9, 44.4, 70.6, 86.4, 95.5, 100), `val%cum` = c(8.7, 26.9, 44.4, 70.6, 86.4, 95.5, 100)), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c(
        "freqtab",
        "data.frame"
      )))
    ), `Very Good.VVS2` = list(licznosc = list(
      color = structure(list(
        n = c(
          141, 298, 249, 302, 145,
          71, 29
        ), `%` = c(11.4, 24.1, 20.2, 24.5, 11.7, 5.7, 2.3), `val%` = c(11.4, 24.1, 20.2, 24.5, 11.7, 5.7, 2.3),
        `%cum` = c(11.4, 35.5, 55.7, 80.2, 91.9, 97.7, 100), `val%cum` = c(
          11.4, 35.5, 55.7, 80.2, 91.9, 97.7,
          100
        )
      ), row.names = c(
        "D", "E", "F", "G", "H", "I",
        "J"
      ), class = c("freqtab", "data.frame"))
    )), Premium.VVS2 = list(
      licznosc = list(color = structure(list(n = c(
        94, 121,
        146, 275, 118, 82, 34
      ), `%` = c(
        10.8, 13.9, 16.8, 31.6,
        13.6, 9.4, 3.9
      ), `val%` = c(
        10.8, 13.9, 16.8, 31.6, 13.6,
        9.4, 3.9
      ), `%cum` = c(
        10.8, 24.7, 41.5, 73.1, 86.7, 96.1,
        100
      ), `val%cum` = c(
        10.8, 24.7, 41.5, 73.1, 86.7, 96.1,
        100
      )), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c("freqtab", "data.frame")))
    ), Ideal.VVS2 = list(
      licznosc = list(color = structure(list(n = c(
        284, 507,
        520, 774, 289, 178, 54
      ), `%` = c(
        10.9, 19.5, 20, 29.7,
        11.1, 6.8, 2.1
      ), `val%` = c(
        10.9, 19.5, 20, 29.7, 11.1,
        6.8, 2.1
      ), `%cum` = c(
        10.9, 30.4, 50.3, 80, 91.1, 97.9,
        100
      ), `val%cum` = c(
        10.9, 30.4, 50.3, 80, 91.1, 97.9,
        100
      )), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c("freqtab", "data.frame")))
    ), Fair.VVS1 = list(
      licznosc = list(color = structure(list(n = c(
        3, 3, 5,
        3, 1, 1, 1
      ), `%` = c(
        17.6, 17.6, 29.4, 17.6, 5.9, 5.9,
        5.9
      ), `val%` = c(17.6, 17.6, 29.4, 17.6, 5.9, 5.9, 5.9), `%cum` = c(17.6, 35.3, 64.7, 82.4, 88.2, 94.1, 100), `val%cum` = c(
        17.6, 35.3, 64.7, 82.4, 88.2, 94.1,
        100
      )), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c("freqtab", "data.frame")))
    ), Good.VVS1 = list(
      licznosc = list(color = structure(list(
        n = c(
          13, 43,
          35, 41, 31, 22, 1
        ), `%` = c(
          7, 23.1, 18.8, 22, 16.7,
          11.8, 0.5
        ), `val%` = c(
          7, 23.1, 18.8, 22, 16.7, 11.8,
          0.5
        ), `%cum` = c(7, 30.1, 48.9, 71, 87.6, 99.5, 100),
        `val%cum` = c(7, 30.1, 48.9, 71, 87.6, 99.5, 100)
      ), row.names = c(
        "D",
        "E", "F", "G", "H", "I", "J"
      ), class = c("freqtab", "data.frame")))
    ), `Very Good.VVS1` = list(licznosc = list(color = structure(list(
      n = c(52, 170, 174, 190, 115, 69, 19), `%` = c(
        6.6, 21.5,
        22.1, 24.1, 14.6, 8.7, 2.4
      ), `val%` = c(
        6.6, 21.5, 22.1,
        24.1, 14.6, 8.7, 2.4
      ), `%cum` = c(
        6.6, 28.1, 50.2, 74.3,
        88.8, 97.6, 100
      ), `val%cum` = c(
        6.6, 28.1, 50.2, 74.3,
        88.8, 97.6, 100
      )
    ), row.names = c(
      "D", "E", "F", "G",
      "H", "I", "J"
    ), class = c("freqtab", "data.frame")))), Premium.VVS1 = list(
      licznosc = list(color = structure(list(n = c(
        40, 105,
        80, 171, 112, 84, 24
      ), `%` = c(
        6.5, 17, 13, 27.8, 18.2,
        13.6, 3.9
      ), `val%` = c(
        6.5, 17, 13, 27.8, 18.2, 13.6,
        3.9
      ), `%cum` = c(6.5, 23.5, 36.5, 64.3, 82.5, 96.1, 100), `val%cum` = c(6.5, 23.5, 36.5, 64.3, 82.5, 96.1, 100)), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c(
        "freqtab",
        "data.frame"
      )))
    ), Ideal.VVS1 = list(licznosc = list(color = structure(list(
      n = c(144, 335, 440, 594, 326, 179, 29), `%` = c(
        7, 16.4,
        21.5, 29, 15.9, 8.7, 1.4
      ), `val%` = c(
        7, 16.4, 21.5,
        29, 15.9, 8.7, 1.4
      ), `%cum` = c(
        7, 23.4, 44.9, 73.9,
        89.8, 98.6, 100
      ), `val%cum` = c(
        7, 23.4, 44.9, 73.9,
        89.8, 98.6, 100
      )
    ), row.names = c(
      "D", "E", "F", "G",
      "H", "I", "J"
    ), class = c("freqtab", "data.frame")))), Fair.IF = list(
      licznosc = list(color = structure(list(n = c(
        3, 0, 4,
        2, 0, 0, 0
      ), `%` = c(33.3, 0, 44.4, 22.2, 0, 0, 0), `val%` = c(
        33.3,
        0, 44.4, 22.2, 0, 0, 0
      ), `%cum` = c(
        33.3, 33.3, 77.8,
        100, 100, 100, 100
      ), `val%cum` = c(
        33.3, 33.3, 77.8,
        100, 100, 100, 100
      )), row.names = c(
        "D", "E", "F", "G",
        "H", "I", "J"
      ), class = c("freqtab", "data.frame")))
    ),
    Good.IF = list(licznosc = list(color = structure(list(n = c(
      9,
      9, 15, 22, 4, 6, 6
    ), `%` = c(
      12.7, 12.7, 21.1, 31, 5.6, 8.5,
      8.5
    ), `val%` = c(12.7, 12.7, 21.1, 31, 5.6, 8.5, 8.5), `%cum` = c(
      12.7,
      25.4, 46.5, 77.5, 83.1, 91.5, 100
    ), `val%cum` = c(
      12.7, 25.4,
      46.5, 77.5, 83.1, 91.5, 100
    )), row.names = c(
      "D", "E", "F",
      "G", "H", "I", "J"
    ), class = c("freqtab", "data.frame")))),
    `Very Good.IF` = list(licznosc = list(color = structure(list(
      n = c(23, 43, 67, 79, 29, 19, 8), `%` = c(
        8.6, 16, 25,
        29.5, 10.8, 7.1, 3
      ), `val%` = c(
        8.6, 16, 25, 29.5, 10.8,
        7.1, 3
      ), `%cum` = c(
        8.6, 24.6, 49.6, 79.1, 89.9, 97,
        100
      ), `val%cum` = c(
        8.6, 24.6, 49.6, 79.1, 89.9, 97,
        100
      )
    ), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c("freqtab", "data.frame")))), Premium.IF = list(
      licznosc = list(color = structure(list(n = c(
        10, 27,
        31, 87, 40, 23, 12
      ), `%` = c(
        4.3, 11.7, 13.5, 37.8, 17.4,
        10, 5.2
      ), `val%` = c(
        4.3, 11.7, 13.5, 37.8, 17.4, 10,
        5.2
      ), `%cum` = c(4.3, 16.1, 29.6, 67.4, 84.8, 94.8, 100), `val%cum` = c(4.3, 16.1, 29.6, 67.4, 84.8, 94.8, 100)), row.names = c("D", "E", "F", "G", "H", "I", "J"), class = c(
        "freqtab",
        "data.frame"
      )))
    ), Ideal.IF = list(licznosc = list(color = structure(list(
      n = c(28, 79, 268, 491, 226, 95, 25), `%` = c(
        2.3, 6.5,
        22.1, 40.5, 18.6, 7.8, 2.1
      ), `val%` = c(
        2.3, 6.5, 22.1,
        40.5, 18.6, 7.8, 2.1
      ), `%cum` = c(
        2.3, 8.8, 30.9, 71.5,
        90.1, 97.9, 100
      ), `val%cum` = c(
        2.3, 8.8, 30.9, 71.5,
        90.1, 97.9, 100
      )
    ), row.names = c(
      "D", "E", "F", "G",
      "H", "I", "J"
    ), class = c("freqtab", "data.frame"))))
  )

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
