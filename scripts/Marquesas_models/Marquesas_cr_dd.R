args <- commandArgs(TRUE)

data(Marquesas)

relaxedDAISIE::archipelago_analysis(data = Marquesas,
                                    archipelago = "Marquesas",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
