args <- commandArgs(TRUE)

data(Aldabra_Group)

relaxedDAISIE::archipelago_analysis(data = Aldabra_Group,
                                    archipelago = "Aldabra_Group",
                                    idparsopt = 2:5,
                                    parsfix = 0,
                                    idparsfix = 1,
                                    ddmodel = 11,
                                    seed = args[1],
                                    relaxed_model = FALSE)
