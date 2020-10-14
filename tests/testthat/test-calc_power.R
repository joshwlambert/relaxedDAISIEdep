test_that("calc_power produces correct output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    set.seed(1)
    output <- calc_power(lik_ratio_alpha = 5,
                         lik_ratio_model_2 = runif(1000, 0, 100))
    expected_output <- 0.956043956044
    expect_equal(output, expected_output)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("calc_power produces error", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    expect_error(calc_power(lik_ratio_alpha = "string",
                            lik_ratio_model_2 = runif(1000, 0, 100)))
    expect_error(calc_power(lik_ratio_alpha = 5,
                            lik_ratio_model_2 = "string"))
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})
