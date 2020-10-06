args <- commandArgs(TRUE)

data(Aldabra_Group)

load(.../model_1_output)
load(.../model_2_output)

relaxedDAISIE::bootstrap(data = Aldabra_Group,
                         archipelago = "Aldabra_Group",
                         model_1 = "cr_di",
                         model_2 = "cr_dd",
                         model_1_output = ,
                         model_2_output = ,
                         relaxed_model_1 = FALSE,
                         relaxed_model_2 = FALSE,
                         seed = args[1])
