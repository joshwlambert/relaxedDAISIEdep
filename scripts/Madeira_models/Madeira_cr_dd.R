args <- commandArgs(TRUE)

data(Madeira)

relaxedDAISIE::archipelago_analysis(data = Madeira,
                                    archipelago = "Madeira",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
