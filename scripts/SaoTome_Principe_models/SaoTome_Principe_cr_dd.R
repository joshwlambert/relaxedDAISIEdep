args <- commandArgs(TRUE)

data(SaoTome_Principe)

relaxedDAISIE::archipelago_analysis(data = SaoTome_Principe,
                                    archipelago = "SaoTome_Principe",
                                    model = "cr_dd",
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
