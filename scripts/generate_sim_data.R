### Generate simulation data for model performance analysis ###

library(DAISIE)

clado <- c(1.0, 2.0)
ext <- c(1.0, 2.0)
carr_cap <- c(10, 30, Inf)
immig <- c(0.005, 0.01)
ana <- c(0.5, 1.0)
sd <- c(1, 10)

param_space <- expand.grid(clado = clado,
                           ext = ext,
                           carr_cap = carr_cap,
                           immig = immig,
                           ana = ana,
                           sd = sd)


#Simulate with constant rate model

set.seed(1)

cr_sim_data <- list()

#Only need to run the parameter sets without changes to sd
param_sets <- nrow(param_space) / 2

for (i in 1:param_sets) {
  cr_sim_data[[i]] <- DAISIE_sim_constant_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, 1:5]),
    replicates = 10)
}

save(cr_sim_data, file = "cr_sim_data.RData")

#Simulate with relaxed-rate models

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
  rr_clado_sim_data_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 10,
    relaxed_par = "cladogenesis")

  rr_clado_sim_data_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 10,
    relaxed_par = "cladogenesis")

  rr_ext_sim_data_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 10,
    relaxed_par = "extinction")

  rr_ext_sim_data_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 10,
    relaxed_par = "extinction")

  rr_carr_cap_sim_data_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 10,
    relaxed_par = "carrying_capacity")

  rr_carr_cap_sim_data_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 10,
    relaxed_par = "carrying_capacity")

  rr_ana_sim_data_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 10,
    relaxed_par = "anagenesis")

  rr_ana_sim_data_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 10,
    relaxed_par = "anagenesis")
}

save(rr_clado_sim_data_sd1, file = "rr_clado_sim_data_sd1.RData")
save(rr_clado_sim_data_sd10, file = "rr_clado_sim_data_sd10.RData")
save(rr_ext_sim_data_sd1, file = "rr_ext_sim_data_sd1.RData")
save(rr_ext_sim_data_sd10, file = "rr_ext_sim_data_sd10.RData")
save(rr_carr_cap_sim_data_sd1, file = "rr_carr_cap_sim_data_sd1.RData")
save(rr_carr_cap_sim_data_sd10, file = "rr_carr_cap_sim_data_sd10.RData")
save(rr_ana_sim_data_sd1, file = "rr_ana_sim_data_sd1.RData")
save(rr_ana_sim_data_sd10, file = "rr_ana_sim_data_sd10.RData")
