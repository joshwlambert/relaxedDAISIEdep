args <- commandArgs(TRUE)

data(Guadalupe)

relaxedDAISIE::archipelago_analysis(data = Guadalupe,
                                    archipelago = "Guadalupe",
                                    model = "cr_di",
                                    idparsopt = c(1, 2, 4, 5),
                                    parsfix = Inf,
                                    idparsfix = 3,
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = FALSE)
