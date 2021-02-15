test_that("calc_lik_ratio_alpha produces correct output", {
  skip("WIP")
  set.seed(1)
  output <- calc_lik_ratio_alpha(lik_ratio_model_1 = runif(1000, 0, 100))
  expected_output <- 95.3548396006
  expect_equal(output, expected_output)
})

test_that("calc_lik_ratio_alpha produces error", {
  skip("WIP")
  expect_error(calc_lik_ratio_alpha(lik_ratio_model_1 = "string"))
})
