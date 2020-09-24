args <- commandArgs(TRUE)

data(Aldabra_Group)

archipelago_analysis(data = Aldabra_Group,
                     archipelago = "Aldabra_Group",
                     idparsopt = 1:5,
                     parsfix = NULL,
                     idparsfix = NULL,
                     ddmodel = 11,
                     seed = args[1],
                     relaxed_model = FALSE)
