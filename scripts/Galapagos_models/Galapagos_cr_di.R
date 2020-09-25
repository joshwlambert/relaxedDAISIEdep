args <- commandArgs(TRUE)

data(Galapagos)

relaxedDAISIE::archipelago_analysis(data = Galapagos,
                                    archipelago = "Galapagos",
                                    model = "cr_di",
                                    idparsopt = c(1, 2, 4, 5),
                                    parsfix = Inf,
                                    idparsfix = 3,
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = FALSE)
