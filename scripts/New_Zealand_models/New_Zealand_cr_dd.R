args <- commandArgs(TRUE)

data(New_Zealand)

relaxedDAISIE::archipelago_analysis(data = New_Zealand,
                                    archipelago = "New_Zealand",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
