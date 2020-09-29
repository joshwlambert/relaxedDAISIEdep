args <- commandArgs(TRUE)

data(Mauritius_Island)

relaxedDAISIE::archipelago_analysis(data = Mauritius_Island,
                                    archipelago = "Mauritius_Island",
                                    model = "cr_di",
                                    idparsopt = c(1, 2, 4, 5),
                                    parsfix = Inf,
                                    idparsfix = 3,
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = FALSE)
