test_that("MSD works as expected", {
  expect_equal(jedrusiakr::MSD(iris, Sepal.Length, Species == "setosa"), "$M = 5,01$; $SD = 0,35$")
})
