args <- commandArgs(TRUE)

data(Aldabra_Group)

archipelago_analysis(data = Aldabra_Group,
                     archipelago = "Aldabra_Group",
                     idparsopt = 2:6,
                     parsfix = 0,
                     idparsfix = 1,
                     ddmodel = 11,
                     seed = args[1],
                     relaxed_model = TRUE,
                     relaxed_par = "anagenesis")
