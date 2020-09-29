args <- commandArgs(TRUE)

data(Seychelles_Inner)

relaxedDAISIE::archipelago_analysis(data = Seychelles_Inner,
                                    archipelago = "Seychelles_Inner",
                                    model = "cr_dd_no_lambda_c",
                                    idparsopt = 2:5,
                                    parsfix = 0,
                                    idparsfix = 1,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
