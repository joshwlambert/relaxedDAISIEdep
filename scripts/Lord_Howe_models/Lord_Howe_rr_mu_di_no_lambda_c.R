args <- commandArgs(TRUE)

data(Lord_Howe)

relaxedDAISIE::archipelago_analysis(data = Lord_Howe,
                                    archipelago = "Lord_Howe",
                                    model = "rr_mu_di_no_lambda_c",
                                    idparsopt = c(2, 4, 5, 6),
                                    parsfix = c(0, Inf),
                                    idparsfix = c(1, 3),
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "extinction")
