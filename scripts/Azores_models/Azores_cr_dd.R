args <- commandArgs(TRUE)

data(Azores)

relaxedDAISIE::archipelago_analysis(data = Azores,
                                    archipelago = "Azores",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
