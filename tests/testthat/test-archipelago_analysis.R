test_that("archipelago_analysis returns the correct ouput", {
  skip("WIP")
  output <- relaxedDAISIE::archipelago_analysis(
    data = Aldabra_Group,
    archipelago = "Aldabra_Group",
    model = "cr_dd",
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    seed = 1,
    relaxed_model = FALSE,
    save_output = FALSE)
  expected_output <- list(ml = data.frame(lambda_c = 1.07218523312338e-11,
                                          mu = 0.621412899851853,
                                          K = Inf,
                                          gamma = 0.016057129238812,
                                          lambda_a = 1.00796307163172,
                                          loglik = -73.4101646006971,
                                          df = 5,
                                          conv = 0),
                          bic = 190.548490928352)

  expect_equal(output, expected_output)
})

test_that("archipelago_analysis correctly saves ouput", {
  skip("TRAVIS doesn't recognise file address")
  relaxedDAISIE::archipelago_analysis(
    data = Aldabra_Group,
    archipelago = "Aldabra_Group",
    model = "cr_dd",
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    seed = 1,
    relaxed_model = FALSE,
    save_output = TRUE)
  output <- file.exists(paste(
    "C:/Users/user/Documents/github/relaxedDAISIE/",
    "inst/results/Aldabra_Group/Aldabra_Group_cr_dd_1.rds",
    sep = ""))

  expect_true(output)
})

test_that("archipelago_analysis correctly errors when input is incorrect", {
  skip("WIP")
  expect_error(archipelago_analysis(data = Aldabra_Group,
                                    archipelago = "Aldabra_Group",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 4,
                                    seed = 1,
                                    relaxed_model = FALSE,
                                    save_output = FALSE))

  expect_error(archipelago_analysis(data = Aldabra_Group,
                                    archipelago = "Aldabra_Group",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = "string",
                                    relaxed_model = FALSE,
                                    save_output = FALSE))
})
