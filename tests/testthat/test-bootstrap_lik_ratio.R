test_that("bootstrap_lik_ratio produces the correct output", {
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
       seed = 1,
       save_output = FALSE)

    expected_output <- list(lik_ratio_0 = 5,
                            lik_ratio_model_1 = 1.0527272378933,
                            lik_ratio_model_2 = 1.08002495836e-12,
                            ml_1_model_1 = data.frame(
                              lambda_c = 1.01579120031,
                              mu = 0.161189649777,
                              K = Inf,
                              gamma = 0.00828218665362,
                              lambda_a = 6.2058041611e-09,
                              loglik = -54.7306221122,
                              df = 5,
                              conv = 0),
                            ml_2_model_1 = data.frame(
                              lambda_c = 1.07175370341,
                              mu = 0.675534112819,
                              K = Inf,
                              gamma = 0.00942320417144,
                              lambda_a = 2.70770565774e-13,
                              loglik = -55.7833493501,
                              df = 4,
                              conv = 0),
                            ml_1_model_2 = data.frame(
                              lambda_c = 0.887088049795,
                              mu = 0.720075465905,
                              K = Inf,
                              gamma = 0.0999562511781,
                              lambda_a = 0.482428428204,
                              loglik = -341.252052073,
                              df = 5,
                              conv = 0),
                            ml_2_model_1 = data.frame(
                              lambda_c = 0.887088077566,
                              mu = 0.720075720824,
                              K = Inf,
                              gamma = 0.0999562516145,
                              lambda_a = 0.482427774055,
                              loglik = -341.252052073,
                              df = 4,
                              conv = 0))

    expect_equal(output, expected_output)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("bootstrap_lik_ratio correctly saves output", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    data(Aldabra_Group)
    relaxedDAISIE::bootstrap_lik_ratio(
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
      seed = 1,
      save_output = TRUE)

    output <- file.exists(paste(
      "C:/Users/user/Documents/github/relaxedDAISIE/",
      "data/Aldabra_Group/Aldabra_Group.RData",
      sep = ""))

    expect_true(output)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})
