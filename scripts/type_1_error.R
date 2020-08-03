library(DAISIE)

set.seed(1)

#create parameter space

lac <- c(1.0, 2.0)
mu <- c(1.0, 2.0)
K <- c(10, 30, Inf)
gam <- c(0.005, 0.01)
laa <- c(0.5, 1.0)

param_space <- expand.grid(lac, mu, K, gam, laa)

#Simulate with CR model

cr_data_set <- list()

for (i in seq_len(nrow(param_space))) {
  cr_data_set[[i]] <- DAISIE_sim_constant_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1000)
}

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
