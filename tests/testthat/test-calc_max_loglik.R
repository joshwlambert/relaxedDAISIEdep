test_that("calc_max_loglik produces correct output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    output <- calc_max_loglik(archipelago = "Aldabra_Group",
                              model = "cr_di")
    expected_output <- list(list(ml = data.frame(lambda_c = 4.20066537381e-12,
                                            mu = 0.621368299046,
                                            K = 46.2764408939,
                                            gamma = 0.0160573857279,
                                            lambda_a = 1.00780442154,
                                            loglik = -73.4101645492,
                                            df = 5,
                                            conv = 0),
                            bic = 190.548490825))
    expect_equal(output, expected_output)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})
