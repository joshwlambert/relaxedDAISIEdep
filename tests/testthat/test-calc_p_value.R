test_that("calc_p_value produces correct output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    set.seed(1)
    output <- calc_p_value(lik_ratio_0 = 10,
                           lik_ratio_model_1 = runif(1000, 0, 100))
    expected_output <- 0.904095904096
    expect_equal(output, expected_output)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("calc_p_value produces error", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    expect_error(calc_p_value(lik_ratio_0 = "string",
                              lik_ratio_model_1 = runif(1000, 0, 100)))
    expect_error(calc_p_value(lik_ratio_0 = 10,
                              lik_ratio_model_1 = "string"))
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

