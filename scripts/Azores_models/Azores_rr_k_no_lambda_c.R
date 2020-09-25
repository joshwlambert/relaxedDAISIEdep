args <- commandArgs(TRUE)

data(Azores)

relaxedDAISIE::archipelago_analysis(data = Azores,
                                    archipelago = "Azores",
                                    model = "rr_k_no_lambda_c",
                                    idparsopt = 2:6,
                                    parsfix = 0,
                                    idparsfix = 1,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "carrying_capacity")
