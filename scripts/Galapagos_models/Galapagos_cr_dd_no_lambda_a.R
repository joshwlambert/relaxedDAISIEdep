args <- commandArgs(TRUE)

data(Galapagos)

relaxedDAISIE::archipelago_analysis(data = Galapagos,
                                    archipelago = "Galapagos",
                                    model = "cr_dd_no_lambda_a",
                                    idparsopt = 1:4,
                                    parsfix = 0,
                                    idparsfix = 5,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
