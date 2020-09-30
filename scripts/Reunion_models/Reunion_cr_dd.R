args <- commandArgs(TRUE)

data(Reunion)

relaxedDAISIE::archipelago_analysis(data = Reunion,
                                    archipelago = "Reunion",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
