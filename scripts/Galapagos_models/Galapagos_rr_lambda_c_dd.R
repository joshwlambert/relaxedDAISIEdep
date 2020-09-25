args <- commandArgs(TRUE)

data(Galapagos)

relaxedDAISIE::archipelago_analysis(data = Galapagos,
                                    archipelago = "Galapagos",
                                    model = "rr_lambda_c_dd",
                                    idparsopt = 1:6,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "cladogenesis")
