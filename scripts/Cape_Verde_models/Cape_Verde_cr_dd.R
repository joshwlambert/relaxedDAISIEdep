args <- commandArgs(TRUE)

data(Cape_Verde)

relaxedDAISIE::archipelago_analysis(data = Cape_Verde,
                                    archipelago = "Cape_Verde",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
