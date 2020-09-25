test_that("archipelago_analysis returns the correct ouput", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
    output <- archipelago_analysis(data = Aldabra_Group,
                                   archipelago = "Aldabra_Group",
                                   model = "cr_dd",
                                   idparsopt = 1:5,
                                   parsfix = NULL,
                                   idparsfix = NULL,
                                   ddmodel = 11,
                                   seed = 1,
                                   relaxed_model = FALSE,
                                   save_output = FALSE)
    expected_output <- list(ml = data.frame(lambda_c = 1.88986504583e-10,
                                            mu = 0.652282694565,
                                            K = 0.571806826695,
                                            gamma = 0.0164538541001,
                                            lambda_a = 1.01020027363,
                                            loglik = -73.362384727,
                                            df = 5,
                                            conv = 0),
                            BIC = 190.452931181)

    expect_equal(output, expected_output)
  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})

test_that("archipelago_analysis correctly errors when input is incorrect", {
  if (Sys.getenv("TRAVIS") != "" || Sys.getenv("APPVEYOR") != "") {
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

  } else{
    skip("Run only on TRAVIS and AppVeyor")
  }
})




