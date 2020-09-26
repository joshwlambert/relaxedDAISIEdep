args <- commandArgs(TRUE)

data(Greater_Antilles)

relaxedDAISIE::archipelago_analysis(data = Greater_Antilles,
                                    archipelago = "Greater_Antilles",
                                    model = "rr_k",
                                    idparsopt = 1:6,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "carrying_capacity")
