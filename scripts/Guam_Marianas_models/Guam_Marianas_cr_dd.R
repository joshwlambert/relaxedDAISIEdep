args <- commandArgs(TRUE)

data(Guam_Marianas)

relaxedDAISIE::archipelago_analysis(data = Guam_Marianas,
                                    archipelago = "Guam_Marianas",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
