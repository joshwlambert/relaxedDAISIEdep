test_that("calc_lik_ratio_alpha produces correct output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    set.seed(1)
    output <- calc_lik_ratio_alpha(lik_ratio_model_1 = runif(1000, 0, 100))
    expected_output <- 95.3548396006
    expect_equal(output, expected_output)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("calc_lik_ratio_alpha produces error", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    expect_error(calc_lik_ratio_alpha(lik_ratio_model_1 = "string"))
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})
