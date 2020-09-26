args <- commandArgs(TRUE)

data(Guadalupe)

relaxedDAISIE::archipelago_analysis(data = Guadalupe,
                                    archipelago = "Guadalupe",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
