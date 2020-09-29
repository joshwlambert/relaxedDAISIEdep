args <- commandArgs(TRUE)

data(Lord_Howe)

relaxedDAISIE::archipelago_analysis(data = Lord_Howe,
                                    archipelago = "Lord_Howe",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
