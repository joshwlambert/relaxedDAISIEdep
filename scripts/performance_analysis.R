library(DAISIE)

args <- commandArgs(TRUE)

results <- paste("performance_analysis",
                 args[2],
                 args[3],
                 args[1],
                 sep = "_")
results_path <- file.path(getwd(),
                          "results",
                          "performance_analysis",
                          results)

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

ml <- list()

for (i in seq_along(sim)) {
  if (args[3] == "cr") {
    ml[[i]] <- DAISIE_ML_CS(
      datalist = sim[[i]][[1]],
      initparsopt = c(1, 1, 30, 0.01, 1),
      idparsopt = 1:5,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = 1)

  }
  if (args[3] == "rr_lambda_c") {
    ml[[i]] <- DAISIE_ML_CS(
      datalist = sim[[i]][[1]],
      initparsopt = c(1, 1, 30, 0.01, 1, sd[i]),
      idparsopt = 1:6,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = create_CS_version(model = 2,
                                     relaxed_par = "cladogenesis"))
  }
  if (args[3] == "rr_mu") {
    ml[[i]] <- DAISIE_ML_CS(
      datalist = sim[[i]][[1]],
      initparsopt = c(1, 1, 30, 0.01, 1, sd[i]),
      idparsopt = 1:6,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = create_CS_version(model = 2,
                                     relaxed_par = "extinction"))
  }
  if (args[3] == "rr_k") {
    ml[[i]] <- DAISIE_ML_CS(
      datalist = sim[[i]][[1]],
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
    ml[[i]] <- DAISIE_ML_CS(
      datalist = sim[[i]][[1]],
      initparsopt = c(1, 1, 30, 0.01, 1, sd[i]),
      idparsopt = 1:6,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = create_CS_version(model = 2,
                                     relaxed_par = "anagenesis"))
  }
}

results_file <- paste(results, ".RData", sep = "")
results_file_path <- file.path(results_path, results_file)
save(ml, file = results_file_path)
