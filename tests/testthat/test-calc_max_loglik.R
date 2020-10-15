test_that("calc_max_loglik produces correct output", {
  output <- calc_max_loglik(archipelago = "Aldabra_Group",
                            model = "cr_dd")
  expected_output <- list(ml = data.frame(lambda_c = 2.95333497114e-11,
                                          mu = 0.652208416987,
                                          K = 0.780567632535,
                                          gamma = 0.0163642212586,
                                          lambda_a = 1.01019154261,
                                          loglik = -73.3548314268,
                                          df = 5,
                                          conv = 0),
                          bic = 190.437824581)
  expect_equal(output, expected_output)
})
