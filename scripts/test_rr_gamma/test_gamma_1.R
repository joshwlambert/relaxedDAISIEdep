# Testing whether relaxed gamma can be estimated

library(DAISIE)

clado <- 1.0
ext <- 1.0
carr_cap <- c(10, Inf)
immig <- c(0.01, 0.05)
ana <- 1.0
sd <- c(0.01, 0.05)

param_space <- expand.grid(clado = clado,
                           ext = ext,
                           carr_cap = carr_cap,
                           immig = immig,
                           ana = ana,
                           sd = sd)

#Simulate with relaxed-rate models

set.seed(1)

rr_gamma_sim_data <- DAISIE_sim_relaxed_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[1, ]),
    replicates = 2,
    relaxed_par = "immigration")

rr_gamma_ml <- list()
for (i in seq_along(rr_gamma_sim_data)) {
  rr_gamma_ml[[i]] <- DAISIE_ML_CS(
    datalist = rr_gamma_sim_data[[i]],
    initparsopt = as.numeric(param_space[1, ]),
    idparsopt = 1:6,
    idparsfix = NULL,
    parsfix = NULL,
    optimmethod = "simplex",
    CS_version = create_CS_version(
      model = 2,
      relaxed_par = "immigration"))
}

#Save results
results_file_path <- file.path(getwd(), "results", "test_gamma",
                               "test_gamma_1.RData")
test_gamma_1 <- list(
  rr_gamma_sim_data = rr_gamma_sim_data,
  rr_gamma_ml = rr_gamma_ml)

save(test_gamma_1,
     file = results_file_path)
