args <- commandArgs(TRUE)

data(Ogasawara)

relaxedDAISIE::archipelago_analysis(data = Ogasawara,
                                    archipelago = "Ogasawara",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
