args <- commandArgs(TRUE)

data(Greater_Antilles)

relaxedDAISIE::archipelago_analysis(data = Greater_Antilles,
                                    archipelago = "Greater_Antilles",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
