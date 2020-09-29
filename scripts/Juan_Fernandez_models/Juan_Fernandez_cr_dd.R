args <- commandArgs(TRUE)

data(Juan_Fernandez)

relaxedDAISIE::archipelago_analysis(data = Juan_Fernandez,
                                    archipelago = "Juan_Fernandez",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
