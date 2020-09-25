args <- commandArgs(TRUE)

data(Canaries)

relaxedDAISIE::archipelago_analysis(data = Canaries,
                                    archipelago = "Canaries",
                                    model = "rr_lambda_a_di",
                                    idparsopt = c(1, 2, 4, 5, 6),
                                    parsfix = Inf,
                                    idparsfix = 3,
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "anagenesis")
