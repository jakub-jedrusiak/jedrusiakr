test_that("msd returns string", {
  expect_equal(msd(iris, Sepal.Length), "$M = 5,84$; $SD = 0,83$")
})

test_that("msd returns string with pl = FALSE", {
  expect_equal(msd(iris, Sepal.Length, pl = FALSE), "$M = 5.84$; $SD = 0.83$")
})

test_that("msd returns string with filter", {
  expect_equal(msd(iris, Sepal.Length, Species == "setosa"), "$M = 5,01$; $SD = 0,35$")
})
