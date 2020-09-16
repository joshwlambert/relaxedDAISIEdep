library(DAISIE)

args <- commandArgs(TRUE)

results_dir <- paste("performance_analysis",
                     args[2],
                     args[3],
                     args[1],
                     sep = "_")
results_dir_path <- file.path(getwd(),
                              "results",
                              "performance_analysis",
                              results_dir)
dir.create(results_dir_path)

set.seed(as.numeric(args[1]))
sd <- c(0.1, 1, 5)

sim <- list()

if (args[2] == "cr") {
  sim[[1]] <- DAISIE_sim_constant_rate(
    time = 5,
    M = 1000,
    pars = c(1, 1, 30, 0.1, 1),
    replicates = 1)
}

for (i in seq_along(sd)) {
  if (args[2] == "rr_lambda_c") {
    sim[[i]] <- DAISIE_sim_relaxed_rate(
      time = 5,
      M = 1000,
      pars = c(1, 1, 30, 0.1, 1, sd[i]),
      replicates = 1,
      relaxed_par = "cladogenesis")
  }
  if (args[2] == "rr_mu") {
    sim[[i]] <- DAISIE_sim_relaxed_rate(
      time = 5,
      M = 1000,
      pars = c(1, 1, 30, 0.1, 1, sd[i]),
      replicates = 1,
      relaxed_par = "extinction")
  }
  if (args[2] == "rr_k") {
    sim[[i]] <- DAISIE_sim_relaxed_rate(
      time = 5,
      M = 1000,
      pars = c(1, 1, 30, 0.1, 1, sd[i]),
      replicates = 1,
      relaxed_par = "carrying_capacity")
  }
  if (args[2] == "rr_lambda_a")
    sim[[i]] <- DAISIE_sim_relaxed_rate(
      time = 5,
      M = 1000,
      pars = c(1, 1, 30, 0.1, 1, sd[i]),
      replicates = 1,
      relaxed_par = "anagenesis")
}

rr_lambda_c_ml <- list()
rr_mu_ml <- list()
rr_k_ml <- list()
rr_lambda_a_ml <- list()

for (i in seq_along(sim)) {
  if (args[3] == "cr") {
    cr_ml <- DAISIE_ML_CS(
      datalist = sim[[i]][[1]],
      initparsopt = c(1, 1, 30, 0.01, 1),
      idparsopt = 1:5,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = 1)
    results_file_path <- file.path(results_dir_path, "cr_ml.RData")
    save(cr_ml, file = results_file_path)
  }
  if (args[3] == "rr_lambda_c") {
    rr_lambda_c_ml[[i]] <- DAISIE_ML_CS(
      datalist = sim[[1]],
      initparsopt = c(1, 1, 30, 0.01, 1, sd[i]),
      idparsopt = 1:6,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = create_CS_version(model = 2,
                                     relaxed_par = "cladogenesis"))

    results_file_path <- file.path(results_dir_path, "rr_lambda_c_ml.RData")
    save(rr_lambda_c_ml, file = results_file_path)
  }
  if (args[3] == "rr_mu") {
    rr_mu_ml[[i]] <- DAISIE_ML_CS(
      datalist = sim[[1]],
      initparsopt = c(1, 1, 30, 0.01, 1, sd[i]),
      idparsopt = 1:6,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = create_CS_version(model = 2,
                                     relaxed_par = "extinction"))
    results_file_path <- file.path(results_dir_path, "rr_mu_ml.RData")
    save(rr_mu_ml, file = results_file_path)
  }
  if (args[3] == "rr_k") {
    rr_k_ml[[i]] <- DAISIE_ML_CS(
      datalist = sim[[1]],
      initparsopt = c(1, 1, 30, 0.01, 1, sd[i]),
      idparsopt = 1:6,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = create_CS_version(model = 2,
                                     relaxed_par = "carrying_capacity"))
    results_file_path <- file.path(results_dir_path, "rr_k_ml.RData")
    save(rr_k_ml, file = results_file_path)
  }
  if (args[3] == "rr_lambda_a") {
    rr_lambda_a_ml[[i]] <- DAISIE_ML_CS(
      datalist = sim[[1]],
      initparsopt = c(1, 1, 30, 0.01, 1, sd[i]),
      idparsopt = 1:6,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = create_CS_version(model = 2,
                                     relaxed_par = "anagenesis"))
    results_file_path <- file.path(results_dir_path, "rr_lambda_a_ml.RData")
    save(rr_lambda_a_ml, file = results_file_path)
  }
}
