args <- commandArgs(TRUE)

data(Comoros)

relaxedDAISIE::archipelago_analysis(data = Comoros,
                                    archipelago = "Comoros",
                                    model = "rr_k",
                                    idparsopt = 1:6,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "carrying_capacity")
