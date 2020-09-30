args <- commandArgs(TRUE)

data(Socorro)

relaxedDAISIE::archipelago_analysis(data = Socorro,
                                    archipelago = "Socorro",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
