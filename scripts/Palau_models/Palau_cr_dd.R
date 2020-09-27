args <- commandArgs(TRUE)

data(Palau)

relaxedDAISIE::archipelago_analysis(data = Palau,
                                    archipelago = "Palau",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
