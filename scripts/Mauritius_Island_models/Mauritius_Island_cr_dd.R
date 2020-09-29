args <- commandArgs(TRUE)

data(Mauritius_Island)

relaxedDAISIE::archipelago_analysis(data = Mauritius_Island,
                                    archipelago = "Mauritius_Island",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
