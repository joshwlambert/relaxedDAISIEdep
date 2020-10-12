test_that("bootstrap produces the correct output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    data(Aldabra_Group)
    output <- relaxedDAISIE::bootstrap_lik_ratio(
      data = Aldabra_Group,
      archipelago = "Aldabra_Group",
      model_1 = data.frame(lambda_c = 0.8135786,
                           mu = 0.6530319,
                           K = 0.5210479,
                           gamma = 0.01645943,
                           lambda_a = 1.01026,
                           loglik = -73.36238,
                           df = 5,
                           conv = 0),
      model_2 = data.frame(lambda_c = 0.8135786,
                           mu = 0.6530319,
                           K = 0.5210479,
                           gamma = 0.01645943,
                           lambda_a = 1.01026,
                           loglik = -73.36238,
                           df = 5,
                           conv = 0),
      idparsopt_1 = c(1, 2, 3, 4, 5),
      idparsopt_2 = c(1, 2, 3, 4, 5),
      parsfix_1 = NULL,
      parsfix_2 = NULL,
      idparsfix_1 = NULL,
      idparsfix_2 = NULL,
      ddmodel_1 = 11,
      ddmodel_2 = 11,
      relaxed_model_1 = FALSE,
      relaxed_model_2 = FALSE,
      relaxed_par_1 = NULL,
      relaxed_par_2 = NULL,
      seed = 1)

    expected_output <- list(
      ml_1_model_1 = data.frame(
        lambda_c = 1.571382865,
        mu = 4.73965052627e-11,
        K = 0.797554886102,
        gamma = 0.0120092155254,
        lambda_a = 0.925702500114,
        loglik = -70.230659207,
        df = 5,
        conv = 0),
      ml_2_model_1 = data.frame(
        lambda_c = 1.571382865,
        mu = 4.73965052627e-11,
        K = 0.797554886102,
        gamma = 0.0120092155254,
        lambda_a = 0.925702500114,
        loglik = -70.230659207,
        df = 5,
        conv = 0),
      ml_1_model_2 = data.frame(
        lambda_c = 1.571382865,
        mu = 4.73965052627e-11,
        K = 0.797554886102,
        gamma = 0.0120092155254,
        lambda_a = 0.925702500114,
        loglik = -70.230659207,
        df = 5,
        conv = 0),
      ml_2_model_2 = data.frame(
        lambda_c = 0.80670520808,
        mu = 1.82754079009,
        K = 0.352536741622,
        gamma = 0.0160496378021,
        lambda_a = 2.43890296807,
        loglik = -49.2578885912,
        df = 5,
        conv = 0))

    expect_equal(output, expected_output)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})
