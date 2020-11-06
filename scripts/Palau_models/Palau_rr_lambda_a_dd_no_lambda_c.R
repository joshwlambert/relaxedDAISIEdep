args <- commandArgs(TRUE)

data(Palau)

relaxedDAISIE::archipelago_analysis(data = Palau,
                                    archipelago = "Palau",
                                    model = "rr_lambda_a_dd_no_lambda_c",
                                    idparsopt = 2:6,
                                    parsfix = 0,
                                    idparsfix = 1,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "anagenesis")
