args <- commandArgs(TRUE)

data(SaoTome_Principe)

relaxedDAISIE::archipelago_analysis(data = SaoTome_Principe,
                                    archipelago = "SaoTome_Principe",
                                    model = "rr_lambda_c_dd",
                                    idparsopt = 1:6,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = TRUE,
                                    relaxed_par = "cladogenesis")
