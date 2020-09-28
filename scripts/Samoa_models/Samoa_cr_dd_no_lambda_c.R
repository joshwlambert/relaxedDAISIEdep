args <- commandArgs(TRUE)

data(Samoa)

relaxedDAISIE::archipelago_analysis(data = Samoa,
                                    archipelago = "Samoa",
                                    model = "cr_dd_no_lambda_c",
                                    idparsopt = 2:5,
                                    parsfix = 0,
                                    idparsfix = 1,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
