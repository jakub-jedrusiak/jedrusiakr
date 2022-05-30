test_that("lower_upper_cor_mat works", {
  library(dplyr)
  library(rstatix)

  r_mat_setosa <- iris %>%
    filter(Species == "setosa") %>%
    select(where(is.numeric)) %>%
    cor_mat()

  r_mat_virginica <- iris %>%
    filter(Species == "virginica") %>%
    select(where(is.numeric)) %>%
    cor_mat()

  result <- jedrusiakr::lower_upper_cor_mat(r_mat_setosa, r_mat_virginica)

  expected_result <- tibble::tribble(
    ~rowname, ~Sepal.Length, ~Sepal.Width, ~Petal.Length, ~Petal.Width,
    "Sepal.Length", NA, "0.46***", "0.86***", "0.28*",
    "Sepal.Width", "0.74***", NA, "0.4**", "0.54***",
    "Petal.Length", "0.27", "0.18", NA, "0.32*",
    "Petal.Width", "0.28", "0.23", "0.33*", NA
  )

  expect_equal(result, expected_result, ignore_attr = TRUE)
})
