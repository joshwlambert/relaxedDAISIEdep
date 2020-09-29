args <- commandArgs(TRUE)

data(Lord_Howe)

relaxedDAISIE::archipelago_analysis(data = Lord_Howe,
                                    archipelago = "Lord_Howe",
                                    model = "cr_di",
                                    idparsopt = c(1, 2, 4, 5),
                                    parsfix = Inf,
                                    idparsfix = 3,
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = FALSE)
