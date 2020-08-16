library(DAISIE)

data(sim_data)

#Inference with CR and RR on CR simulations

cr_sim_cr_ml <- list()
cr_sim_rr_clado_ml <- list()
cr_sim_rr_ext_ml <- list()
cr_sim_rr_carr_cap_ml <- list()
cr_sim_rr_ana_ml <- list()

for (i in seq_along(cr_data_set)) {

  cr_sim_cr_ml[[i]] <- list()
  cr_sim_rr_clado_ml[[i]] <- list()
  cr_sim_rr_ext_ml[[i]] <- list()
  cr_sim_rr_carr_cap_ml[[i]] <- list()
  cr_sim_rr_ana_ml[[i]] <- list()

  for (j in seq_along(cr_data_set[[i]])) {
    cr_sim_cr_ml[[i]][[j]] <- DAISIE_ML_CS(
      datalist = cr_data_set[[i]][[j]],
      initparsopt = c(0.5, 0.5, 20, 0.005, 0.5),
      idparsopt = 1:5,
      idparsfix = NULL,
      parsfix = NULL,
      optimmethod = "simplex")

    cr_sim_rr_clado_ml[[i]][[j]] <- DAISIE_ML_CS(
      datalist = cr_data_set[[i]][[j]],
      initparsopt = c(0.5, 0.5, 20, 0.005, 0.5),
      idparsopt = 1:5,
      idparsfix = NULL,
      parsfix = NULL,
      optimmethod = "simplex",
      CS_version = create_CS_version(
        model = 2,
        pick_parameter = "cladogenesis",
        distribution = "gamma",
        sd = 1,
        multi_rate_optim_method = "optimize"))

    cr_sim_rr_ext_ml[[i]][[j]] <- DAISIE_ML_CS(
      datalist = cr_data_set[[i]][[j]],
      initparsopt = c(0.5, 0.5, 20, 0.005, 0.5),
      idparsopt = 1:5,
      idparsfix = NULL,
      parsfix = NULL,
      optimmethod = "simplex",
      CS_version = create_CS_version(
        model = 2,
        pick_parameter = "extinction",
        distribution = "gamma",
        sd = 1,
        multi_rate_optim_method = "optimize"))

    cr_sim_rr_carr_cap_ml[[i]][[j]] <- DAISIE_ML_CS(
      datalist = cr_data_set[[i]][[j]],
      initparsopt = c(0.5, 0.5, 20, 0.005, 0.5),
      idparsopt = 1:5,
      idparsfix = NULL,
      parsfix = NULL,
      optimmethod = "simplex",
      CS_version = create_CS_version(
        model = 2,
        pick_parameter = "carrying_capacity",
        distribution = "gamma",
        sd = 1,
        multi_rate_optim_method = "optimize"))

    cr_sim_rr_ana_ml[[i]][[j]] <- DAISIE_ML_CS(
      datalist = cr_data_set[[i]][[j]],
      initparsopt = c(0.5, 0.5, 20, 0.005, 0.5),
      idparsopt = 1:5,
      idparsfix = NULL,
      parsfix = NULL,
      optimmethod = "simplex",
      CS_version = create_CS_version(
        model = 2,
        pick_parameter = "anagenesis",
        distribution = "gamma",
        sd = 1,
        multi_rate_optim_method = "optimize"))
  }
}

#Compare models with AICc

#Calculate type I error
