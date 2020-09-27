args <- commandArgs(TRUE)

data(New_Caledonia)

relaxedDAISIE::archipelago_analysis(data = New_Caledonia,
                                    archipelago = "New_Caledonia",
                                    model = "cr_di",
                                    idparsopt = c(1, 2, 4, 5),
                                    parsfix = Inf,
                                    idparsfix = 3,
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = FALSE)
