args <- commandArgs(TRUE)

data(Galapagos)

relaxedDAISIE::archipelago_analysis(data = Galapagos,
                                    archipelago = "Galapagos",
                                    model = "cr_di_no_lambda_a",
                                    idparsopt = c(1, 2, 4),
                                    parsfix = c(Inf, 0),
                                    idparsfix = c(3, 5),
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = FALSE)
