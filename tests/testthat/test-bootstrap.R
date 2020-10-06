test_that("bootstrap produces the correct output", {

  data(Aldabra_Group)

  output <- bootstrap(
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
    relaxed_model_1 = FALSE,
    relaxed_model_2 = FALSE,
    relaxed_par_1 = NULL,
    relaxed_par_2 = NULL,
    seed = 1)

  expect_output <- list(
    ml_1_model_1 = data.frame(
      lambda_c = 4.78895599143e-07,
      mu = 3.25442916604e-07,
      K = 0.285539775068,
      gamma = 0.0119247136336,
      lambda_a = 0.925702053638,
      loglik = -70.3043959543,
      df = 5,
      conv = 0),
    ml_2_model_1 = data.frame(
      lambda_c = 0.8135786,
      mu = 0.6530319,
      K = 0.5210479,
      gamma = 0.01645943,
      lambda_a = 1.01026,
      loglik = -73.36238,
      df = 5,
      conv = 0),
    ml_1_model_2 = data.frame(
      lambda_c = 4.78895599143e-07,
      mu = 3.25442916604e-07,
      K = 0.285539775068,
      gamma = 0.0119247136336,
      lambda_a = 0.925702053638,
      loglik = -70.3043959543,
      df = 5,
      conv = 0),
    ml_2_model_2 = data.frame(
      lambda_c = 4.78895599143e-07,
      mu = 3.25442916604e-07,
      K = 0.285539775068,
      gamma = 0.0119247136336,
      lambda_a = 0.925702053638,
      loglik = -70.3043959543,
      df = 5,
      conv = 0))

  expect_equal(output, expected_output)
})
