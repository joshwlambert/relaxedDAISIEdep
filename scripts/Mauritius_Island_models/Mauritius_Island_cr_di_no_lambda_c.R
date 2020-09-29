args <- commandArgs(TRUE)

data(Mauritius_Island)

relaxedDAISIE::archipelago_analysis(data = Mauritius_Island,
                                    archipelago = "Mauritius_Island",
                                    model = "cr_di_no_lambda_c",
                                    idparsopt = c(2, 4, 5),
                                    parsfix = c(0, Inf),
                                    idparsfix = c(1, 3),
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = FALSE)
