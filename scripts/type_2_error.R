library(DAISIE)

set.seed(1)

#create parameter space

lac <- c(1.0, 2.0)
mu <- c(1.0, 2.0)
K <- c(10, 30, Inf)
gam <- c(0.005, 0.01)
laa <- c(0.5, 1.0)

param_space <- expand.grid(lac, mu, K, gam, laa)

#Simulate with RR models

rr_clado_data_set_sd1 <- list()
rr_clado_data_set_sd10 <- list()
rr_ext_data_set_sd1 <- list()
rr_ext_data_set_sd10 <- list()
rr_carr_cap_data_set_sd1 <- list()
rr_carr_cap_data_set_sd10 <- list()
rr_ana_data_set_sd1 <- list()
rr_ana_data_set_sd10 <- list()

for (i in seq_len(nrow(param_space))) {

  rr_clado_data_set_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1000,
    relaxed_par = "cladogenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 1]),
      sd = 1))

  rr_clado_data_set_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1000,
    relaxed_par = "cladogenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 1]),
      sd = 10))

  rr_ext_data_set_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1000,
    relaxed_par = "extinction",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 2]),
      sd = 1))

  rr_ext_data_set_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1000,
    relaxed_par = "extinction",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 2]),
      sd = 10))

  rr_carr_cap_data_set_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1000,
    relaxed_par = "carrying_capacity",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 3]),
      sd = 1))

  rr_carr_cap_data_set_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1000,
    relaxed_par = "carrying_capacity",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 3]),
      sd = 10))

  rr_ana_data_set_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1000,
    relaxed_par = "anagenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 5]),
      sd = 1))

  rr_ana_data_set_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1000,
    relaxed_par = "anagenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 5]),
      sd = 10))
}

#Inference with CR and RR on RR simulations

rr_clado_sd1_sim_cr_ml <- list()
rr_clado_sd1_sim_rr_clado_ml <- list()
rr_clado_sd1_sim_rr_ext_ml <- list()
rr_clado_sd1_sim_rr_carr_cap_ml <- list()
rr_clado_sd1_sim_rr_ana_ml <- list()

rr_clado_sd10_sim_cr_ml <- list()
rr_clado_sd10_sim_rr_clado_ml <- list()
rr_clado_sd10_sim_rr_ext_ml <- list()
rr_clado_sd10_sim_rr_carr_cap_ml <- list()
rr_clado_sd10_sim_rr_ana_ml <- list()

rr_ext_sd1_sim_cr_ml <- list()
rr_ext_sd1_sim_rr_clado_ml <- list()
rr_ext_sd1_sim_rr_ext_ml <- list()
rr_ext_sd1_sim_rr_carr_cap_ml <- list()
rr_ext_sd1_sim_rr_ana_ml <- list()

rr_ext_sd10_sim_cr_ml <- list()
rr_ext_sd10_sim_rr_clado_ml <- list()
rr_ext_sd10_sim_rr_ext_ml <- list()
rr_ext_sd10_sim_rr_carr_cap_ml <- list()
rr_ext_sd10_sim_rr_ana_ml <- list()

rr_carr_cap_sd1_sim_cr_ml <- list()
rr_carr_cap_sd1_sim_rr_clado_ml <- list()
rr_carr_cap_sd1_sim_rr_ext_ml <- list()
rr_carr_cap_sd1_sim_rr_carr_cap_ml <- list()
rr_carr_cap_sd1_sim_rr_ana_ml <- list()

rr_carr_cap_sd10_sim_cr_ml <- list()
rr_carr_cap_sd10_sim_rr_clado_ml <- list()
rr_carr_cap_sd10_sim_rr_ext_ml <- list()
rr_carr_cap_sd10_sim_rr_carr_cap_ml <- list()
rr_carr_cap_sd10_sim_rr_ana_ml <- list()

rr_ana_sd1_sim_cr_ml <- list()
rr_ana_sd1_sim_rr_clado_ml <- list()
rr_ana_sd1_sim_rr_ext_ml <- list()
rr_ana_sd1_sim_rr_carr_cap_ml <- list()
rr_ana_sd1_sim_rr_ana_ml <- list()

rr_ana_sd10_sim_cr_ml <- list()
rr_ana_sd10_sim_rr_clado_ml <- list()
rr_ana_sd10_sim_rr_ext_ml <- list()
rr_ana_sd10_sim_rr_carr_cap_ml <- list()
rr_ana_sd10_sim_rr_ana_ml <- list()

for (i in seq_along(rr_clado_data_set_sd1)) {

  rr_clado_sd1_sim_cr_ml[[i]] <- list()
  rr_clado_sd1_sim_rr_clado_ml[[i]] <- list()
  rr_clado_sd1_sim_rr_ext_ml[[i]] <- list()
  rr_clado_sd1_sim_rr_carr_cap_ml[[i]] <- list()
  rr_clado_sd1_sim_rr_ana_ml[[i]] <- list()

  rr_clado_sd10_sim_cr_ml[[i]] <- list()
  rr_clado_sd10_sim_rr_clado_ml[[i]] <- list()
  rr_clado_sd10_sim_rr_ext_ml[[i]] <- list()
  rr_clado_sd10_sim_rr_carr_cap_ml[[i]] <- list()
  rr_clado_sd10_sim_rr_ana_ml[[i]] <- list()

  rr_ext_sd1_sim_cr_ml[[i]] <- list()
  rr_ext_sd1_sim_rr_clado_ml[[i]] <- list()
  rr_ext_sd1_sim_rr_ext_ml[[i]] <- list()
  rr_ext_sd1_sim_rr_carr_cap_ml[[i]] <- list()
  rr_ext_sd1_sim_rr_ana_ml[[i]] <- list()

  rr_ext_sd10_sim_cr_ml[[i]] <- list()
  rr_ext_sd10_sim_rr_clado_ml[[i]] <- list()
  rr_ext_sd10_sim_rr_ext_ml[[i]] <- list()
  rr_ext_sd10_sim_rr_carr_cap_ml[[i]] <- list()
  rr_ext_sd10_sim_rr_ana_ml[[i]] <- list()

  rr_carr_cap_sd1_sim_cr_ml[[i]] <- list()
  rr_carr_cap_sd1_sim_rr_clado_ml[[i]] <- list()
  rr_carr_cap_sd1_sim_rr_ext_ml[[i]] <- list()
  rr_carr_cap_sd1_sim_rr_carr_cap_ml[[i]] <- list()
  rr_carr_cap_sd1_sim_rr_ana_ml[[i]] <- list()

  rr_carr_cap_sd10_sim_cr_ml[[i]] <- list()
  rr_carr_cap_sd10_sim_rr_clado_ml[[i]] <- list()
  rr_carr_cap_sd10_sim_rr_ext_ml[[i]] <- list()
  rr_carr_cap_sd10_sim_rr_carr_cap_ml[[i]] <- list()
  rr_carr_cap_sd10_sim_rr_ana_ml[[i]] <- list()

  rr_ana_sd1_sim_cr_ml[[i]] <- list()
  rr_ana_sd1_sim_rr_clado_ml[[i]] <- list()
  rr_ana_sd1_sim_rr_ext_ml[[i]] <- list()
  rr_ana_sd1_sim_rr_carr_cap_ml[[i]] <- list()
  rr_ana_sd1_sim_rr_ana_ml[[i]] <- list()

  rr_ana_sd10_sim_cr_ml[[i]] <- list()
  rr_ana_sd10_sim_rr_clado_ml[[i]] <- list()
  rr_ana_sd10_sim_rr_ext_ml[[i]] <- list()
  rr_ana_sd10_sim_rr_carr_cap_ml[[i]] <- list()
  rr_ana_sd10_sim_rr_ana_ml[[i]] <- list()

  for (j in seq_along(rr_clado_data_set_sd1[[i]])) {
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

#Inference with CR and RR on RR simulations

rr_sim_cr_ml <- list()
rr_sim_rr_clado_ml <- list()
rr_sim_rr_ext_ml <- list()
rr_sim_rr_carr_cap_ml <- list()
r_sim_rr_ana_ml <- list()

for (i in seq_along(cr_data_set)) {

  rr_sim_cr_ml[[i]] <- list()
  rr_sim_rr_clado_ml[[i]] <- list()
  rr_sim_rr_ext_ml[[i]] <- list()
  rr_sim_rr_carr_cap_ml[[i]] <- list()
  rr_sim_rr_ana_ml[[i]] <- list()

  for (j in seq_along(cr_data_set[[i]])) {
    rr_sim_cr_ml[[i]][[j]] <- DAISIE_ML_CS(
      datalist = rr_data_set[[i]][[j]],
      initparsopt = c(0.5, 0.5, 20, 0.005, 0.5),
      idparsopt = 1:5,
      idparsfix = NULL,
      parsfix = NULL,
      optimmethod = "simplex")
    cr_sim_rr_clado_sd1_ml[[i]][[j]] <- DAISIE_ML_CS(
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
    cr_sim_rr_clado_sd5_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 5,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_clado_sd10_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 10,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_ext_sd1_ml[[i]][[j]] <- DAISIE_ML_CS(
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
    cr_sim_rr_ext_sd5_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 5,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_ext_sd10_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 10,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_carr_cap_sd1_ml[[i]][[j]] <- DAISIE_ML_CS(
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
    cr_sim_rr_carr_cap_sd5_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 5,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_carr_cap_sd10_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 10,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_ana_sd1_ml[[i]][[j]] <- DAISIE_ML_CS(
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
    cr_sim_rr_ana_sd5_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 5,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_ana_sd10_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 10,
        multi_rate_optim_method = "optimize"))
  }
}


#Inference with CR and RR on RR simulations

rr_sim_cr_ml <- list()
rr_sim_rr_clado_ml <- list()
rr_sim_rr_ext_ml <- list()
rr_sim_rr_carr_cap_ml <- list()
r_sim_rr_ana_ml <- list()

for (i in seq_along(cr_data_set)) {

  rr_sim_cr_ml[[i]] <- list()
  rr_sim_rr_clado_ml[[i]] <- list()
  rr_sim_rr_ext_ml[[i]] <- list()
  rr_sim_rr_carr_cap_ml[[i]] <- list()
  rr_sim_rr_ana_ml[[i]] <- list()

  for (j in seq_along(cr_data_set[[i]])) {
    rr_sim_cr_ml[[i]][[j]] <- DAISIE_ML_CS(
      datalist = rr_data_set[[i]][[j]],
      initparsopt = c(0.5, 0.5, 20, 0.005, 0.5),
      idparsopt = 1:5,
      idparsfix = NULL,
      parsfix = NULL,
      optimmethod = "simplex")
    cr_sim_rr_clado_sd1_ml[[i]][[j]] <- DAISIE_ML_CS(
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
    cr_sim_rr_clado_sd5_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 5,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_clado_sd10_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 10,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_ext_sd1_ml[[i]][[j]] <- DAISIE_ML_CS(
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
    cr_sim_rr_ext_sd5_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 5,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_ext_sd10_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 10,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_carr_cap_sd1_ml[[i]][[j]] <- DAISIE_ML_CS(
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
    cr_sim_rr_carr_cap_sd5_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 5,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_carr_cap_sd10_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 10,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_ana_sd1_ml[[i]][[j]] <- DAISIE_ML_CS(
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
    cr_sim_rr_ana_sd5_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 5,
        multi_rate_optim_method = "optimize"))
    cr_sim_rr_ana_sd10_ml[[i]][[j]] <- DAISIE_ML_CS(
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
        sd = 10,
        multi_rate_optim_method = "optimize"))
  }
}

