args <- commandArgs(TRUE)

data(Samoa)

relaxedDAISIE::archipelago_analysis(data = Samoa,
                                    archipelago = "Samoa",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
