args <- commandArgs(TRUE)

data(Hispaniola)

relaxedDAISIE::archipelago_analysis(data = Hispaniola,
                                    archipelago = "Hispaniola",
                                    model = "rr_k_no_lambda_a",
                                    idparsopt = c(1, 2, 3, 4, 6),
                                    parsfix = 0,
                                    idparsfix = 5,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "carrying_capacity")
