library(DAISIE)

set.seed(1)

lac <- c(1.0, 2.0)
mu <- c(1.0, 2.0)
K <- c(10, 30, Inf)
gam <- c(0.005, 0.01)
laa <- c(0.5, 1.0)

param_space <- expand.grid(lac, mu, K, gam, laa)

cr_data_set <- list()
rr_clado_data_set_sd1 <- list()
rr_clado_data_set_sd5 <- list()
rr_clado_data_set_sd10 <- list()
rr_ext_data_set_sd1 <- list()
rr_ext_data_set_sd5 <- list()
rr_ext_data_set_sd10 <- list()
rr_carr_cap_data_set_sd1 <- list()
rr_carr_cap_data_set_sd5 <- list()
rr_carr_cap_data_set_sd10 <- list()
rr_ana_data_set_sd1 <- list()
rr_ana_data_set_sd5 <- list()
rr_ana_data_set_sd10 <- list()

for (i in seq_len(nrow(param_space))) {

  cr_data_set[[i]] <- DAISIE_sim_constant_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1) #1000

  rr_clado_data_set_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1, #1000
    relaxed_par = "cladogenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 1]),
      sd = 1))

  rr_clado_data_set_sd5[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1, #1000
    relaxed_par = "cladogenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 1]),
      sd = 5))

  rr_clado_data_set_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1, #1000
    relaxed_par = "cladogenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 1]),
      sd = 10))

  rr_ext_data_set_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1, #1000
    relaxed_par = "extinction",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 2]),
      sd = 1))

  rr_ext_data_set_sd5[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1, #1000
    relaxed_par = "extinction",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 2]),
      sd = 5))

  rr_ext_data_set_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1, #1000
    relaxed_par = "extinction",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 2]),
      sd = 10))

  rr_carr_cap_data_set_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1, #1000
    relaxed_par = "carrying_capacity",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 3]),
      sd = 1))

  rr_carr_cap_data_set_sd5[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1, #1000
    relaxed_par = "carrying_capacity",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 3]),
      sd = 5))

  rr_carr_cap_data_set_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1, #1000
    relaxed_par = "carrying_capacity",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 3]),
      sd = 10))

  rr_ana_data_set_sd1[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1, #1000
    relaxed_par = "anagenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 5]),
      sd = 1))

  rr_ana_data_set_sd5[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1, #1000
    relaxed_par = "anagenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 5]),
      sd = 5))

  rr_ana_data_set_sd10[[i]] <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 1, #1000
    relaxed_par = "anagenesis",
    relaxed_rate_pars = create_relaxed_rate_pars(
      mean = as.numeric(param_space[i, 5]),
      sd = 10))
}

for (i in seq_len(length(data_set))) {
    results[[i]] <- DAISIE_ML_CS(datalist = data_set[[1]][[i]][[j]],
                                         initparsopt = c(0.5, 0.5, 20, 0.005, 0.5),
                                         idparsopt = 1:5,
                                         idparsfix = NULL,
                                         parsfix = NULL,
                                         optimmethod = "simplex")
}
