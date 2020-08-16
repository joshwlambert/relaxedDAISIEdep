### Generate simulation data for model performance analysis ###

#Simulate with constant rate model

data(param_space)

set.seed(1)

cr_sim_data <- list()

for (i in seq_len(nrow(param_space))) {
  cr_sim_data[[i]] <- DAISIE_sim_constant_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, 1:5]),
    replicates = 1000)
}

save(cr_sim_data, file = "cr_sim_data.RData")

#Simulate with relaxed-rate models

data(param_space)

set.seed(1)

rr_clado_sim_data_sd1 <- list()
rr_clado_sim_data_sd10 <- list()
rr_ext_sim_data_sd1 <- list()
rr_ext_sim_data_sd10 <- list()
rr_carr_cap_sim_data_sd1 <- list()
rr_carr_cap_sim_data_sd10 <- list()
rr_ana_sim_data_sd1 <- list()
rr_ana_sim_data_sd10 <- list()

for (i in seq_len(nrow(param_space))) {
  rr_clado_data_set_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, 1:5]),
    replicates = 1000,
    relaxed_par = "cladogenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 1]),
      sd = 1))

  rr_clado_data_set_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, 1:5]),
    replicates = 1000,
    relaxed_par = "cladogenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 1]),
      sd = 10))

  rr_ext_data_set_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, 1:5]),
    replicates = 1000,
    relaxed_par = "extinction",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 2]),
      sd = 1))

  rr_ext_data_set_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, 1:5]),
    replicates = 1000,
    relaxed_par = "extinction",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 2]),
      sd = 10))

  rr_carr_cap_data_set_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, 1:5]),
    replicates = 1000,
    relaxed_par = "carrying_capacity",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 3]),
      sd = 1))

  rr_carr_cap_data_set_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, 1:5]),
    replicates = 1000,
    relaxed_par = "carrying_capacity",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 3]),
      sd = 10))

  rr_ana_data_set_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, 1:5]),
    replicates = 1000,
    relaxed_par = "anagenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 5]),
      sd = 1))

  rr_ana_data_set_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, 1:5]),
    replicates = 1000,
    relaxed_par = "anagenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 5]),
      sd = 10))
}
