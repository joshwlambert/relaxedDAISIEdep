args <- commandArgs(TRUE)

data(New_Caledonia)

relaxedDAISIE::archipelago_analysis(data = New_Caledonia,
                                    archipelago = "New_Caledonia",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
