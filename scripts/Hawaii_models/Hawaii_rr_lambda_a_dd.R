args <- commandArgs(TRUE)

data(Hawaii)

relaxedDAISIE::archipelago_analysis(data = Hawaii,
                                    archipelago = "Hawaii",
                                    model = "rr_lambda_a_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "anagenesis")
