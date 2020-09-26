args <- commandArgs(TRUE)

data(Guam_Marianas)

relaxedDAISIE::archipelago_analysis(data = Guam_Marianas,
                                    archipelago = "Guam_Marianas",
                                    model = "cr_dd_no_lambda_c",
                                    idparsopt = 2:5,
                                    parsfix = 0,
                                    idparsfix = 1,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
