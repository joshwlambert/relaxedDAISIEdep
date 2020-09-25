args <- commandArgs(TRUE)

data(Canaries)

relaxedDAISIE::archipelago_analysis(data = Canaries,
                                    archipelago = "Canaries",
                                    model = "rr_mu_dd",
                                    idparsopt = 1:6,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "extinction")
