args <- commandArgs(TRUE)

data(Chatham)

relaxedDAISIE::archipelago_analysis(data = Chatham,
                                    archipelago = "Chatham",
                                    model = "cr_dd_no_lambda_c",
                                    idparsopt = 2:5,
                                    parsfix = 0,
                                    idparsfix = 1,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
