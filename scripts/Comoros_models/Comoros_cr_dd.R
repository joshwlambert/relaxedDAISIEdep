args <- commandArgs(TRUE)

data(Comoros)

relaxedDAISIE::archipelago_analysis(data = Comoros,
                                    archipelago = "Comoros",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
