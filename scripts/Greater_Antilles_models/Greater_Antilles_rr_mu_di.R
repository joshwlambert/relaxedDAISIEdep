args <- commandArgs(TRUE)

data(Greater_Antilles)

relaxedDAISIE::archipelago_analysis(data = Greater_Antilles,
                                    archipelago = "Greater_Antilles",
                                    model = "rr_mu_di",
                                    idparsopt = c(1, 2, 4, 5, 6),
                                    parsfix = Inf,
                                    idparsfix = 3,
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "extinction")
