args <- commandArgs(TRUE)

data(Seychelles_Inner)

relaxedDAISIE::archipelago_analysis(data = Seychelles_Inner,
                                    archipelago = "Seychelles_Inner",
                                    model = "cr_di_no_lambda_c",
                                    idparsopt = c(2, 4, 5),
                                    parsfix = c(0, Inf),
                                    idparsfix = c(1, 3),
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = FALSE)
