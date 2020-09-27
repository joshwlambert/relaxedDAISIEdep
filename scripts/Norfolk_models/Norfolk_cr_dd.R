args <- commandArgs(TRUE)

data(Norfolk)

relaxedDAISIE::archipelago_analysis(data = Norfolk,
                                    archipelago = "Norfolk",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
