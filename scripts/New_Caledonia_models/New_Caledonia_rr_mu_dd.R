args <- commandArgs(TRUE)

data(New_Caledonia)

relaxedDAISIE::archipelago_analysis(data = New_Caledonia,
                                    archipelago = "New_Caledonia",
                                    model = "rr_mu_dd",
                                    idparsopt = 1:6,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "extinction")
