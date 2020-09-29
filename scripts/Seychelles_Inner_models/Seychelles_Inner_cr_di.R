args <- commandArgs(TRUE)

data(Seychelles_Inner)

relaxedDAISIE::archipelago_analysis(data = Seychelles_Inner,
                                    archipelago = "Seychelles_Inner",
                                    model = "cr_di",
                                    idparsopt = c(1, 2, 4, 5),
                                    parsfix = Inf,
                                    idparsfix = 3,
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = FALSE)
