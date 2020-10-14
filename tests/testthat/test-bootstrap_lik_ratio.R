test_that("bootstrap produces the correct output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    data(Aldabra_Group)
    output <- relaxedDAISIE::bootstrap_lik_ratio(
       data = Aldabra_Group,
       archipelago = "Aldabra_Group",
       model_1 = data.frame(lambda_c = 1.5,
                            mu = 1,
                            K = 40,
                            gamma = 0.01,
                            lambda_a = 1,
                            loglik = -75,
                            df = 5,
                            conv = 0),
       model_2 = data.frame(lambda_c = 1,
                            mu = 0.8,
                            K = Inf,
                            gamma = 00.1,
                            lambda_a = 1,
                            loglik = -80,
                            df = 4,
                            conv = 0),
       idparsopt_1 = c(1, 2, 3, 4, 5),
       idparsopt_2 = c(1, 2, 4, 5),
       parsfix_1 = NULL,
       parsfix_2 = Inf,
       idparsfix_1 = NULL,
       idparsfix_2 = 3,
       ddmodel_1 = 11,
       ddmodel_2 = 0,
       relaxed_model_1 = FALSE,
       relaxed_model_2 = FALSE,
       relaxed_par_1 = NULL,
       relaxed_par_2 = NULL,
       seed = 1)

    expected_output <- list(lik_ratio_0 = 0,
                            lik_ratio_model_1 = 0,
                            lik_ratio_model_2 = 0)

    expect_equal(output, expected_output)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})
