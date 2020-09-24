commandArgs(TRUE)

seed <- args[1]

archipelago_analysis(data = Aldabra_Group,
                     archipelago = "Aldabra_Group",
                     idparsopt = 1:5,
                     parsfix = NULL,
                     idparsfix = NULL,
                     ddmodel = 11,
                     seed = seed,
                     relaxed_model = FALSE)
