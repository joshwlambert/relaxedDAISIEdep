args <- commandArgs(TRUE)

data(New_Zealand)

relaxedDAISIE::archipelago_analysis(data = New_Zealand,
                                    archipelago = "New_Zealand",
                                    model = "rr_lambda_c_di",
                                    idparsopt = c(1, 2, 4, 5, 6),
                                    parsfix = Inf,
                                    idparsfix = 3,
                                    ddmodel = 0,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "cladogenesis")
