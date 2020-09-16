library(DAISIE)

args <- commandArgs(TRUE)

set.seed(as.numeric(args[1]))
sd <- c(0.1, 1, 5)

if (args[2] == "cr") {
  sim <- DAISIE_sim_constant_rate(
    time = 5,
    M = 1000,
    pars = c(1, 1, 30, 0.1, 1),
    replicates = 1)
}

if (args[3] == "cr") {
  cr_ml <- DAISIE_ML_CS(
    datalist = sim[[1]],
    initparsopt = c(1, 1, 30, 0.01, 1),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
  results_file_path <- file.path(getwd(), "results", "performance_analysis",
                                 "cr_ml.RData")
  save(cr_ml,
       file = results_file_path)
}

for (i in 1:3) {
  if (args[2] == "rr_lambda_c") {
    sim <- DAISIE_sim_relaxed_rate(
      time = 5,
      M = 1000,
      pars = c(1, 1, 30, 0.1, 1, sd[i]),
      replicates = 1,
      relaxed_par = "cladogenesis")
  }
  if (args[2] == "rr_mu") {
    sim <- DAISIE_sim_relaxed_rate(
      time = 5,
      M = 1000,
      pars = c(1, 1, 30, 0.1, 1, sd[i]),
      replicates = 1,
      relaxed_par = "extinction")
  }
  if (args[2] == "rr_k") {
    sim <- DAISIE_sim_relaxed_rate(
      time = 5,
      M = 1000,
      pars = c(1, 1, 30, 0.1, 1, sd[i]),
      replicates = 1,
      relaxed_par = "carrying_capacity")
  }
  if (args[2] == "rr_lambda_a")
    sim <- DAISIE_sim_relaxed_rate(
      time = 5,
      M = 1000,
      pars = c(1, 1, 30, 0.1, 1, sd[i]),
      replicates = 1,
      relaxed_par = "anagenesis")

  if (args[3] == "rr_lambda_c") {
    rr_lambda_c_ml <- DAISIE_ML_CS(
      datalist = sim[[1]],
      initparsopt = c(1, 1, 30, 0.01, 1, sd[i]),
      idparsopt = 1:6,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = create_CS_version(model = 2,
                                     relaxed_par = "cladogenesis"))

    results_file_path <- file.path(getwd(), "results", "performance_analysis",
                                   "rr_lambda_c_ml.RData")
    save(rr_lambda_c_ml,
         file = results_file_path)
  }
  if (args[3] == "rr_mu") {
    rr_mu_ml <- DAISIE_ML_CS(
      datalist = sim[[1]],
      initparsopt = c(1, 1, 30, 0.01, 1, sd[i]),
      idparsopt = 1:6,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = create_CS_version(model = 2,
                                     relaxed_par = "extinction"))
    results_file_path <- file.path(getwd(), "results", "performance_analysis",
                                   "rr_mu_ml.RData")
    save(rr_mu_ml,
         file = results_file_path)
  }
  if (args[3] == "rr_k") {
    rr_k_ml <- DAISIE_ML_CS(
      datalist = sim[[1]],
      initparsopt = c(1, 1, 30, 0.01, 1, sd[i]),
      idparsopt = 1:6,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = create_CS_version(model = 2,
                                     relaxed_par = "carrying_capacity"))
    results_file_path <- file.path(getwd(), "results", "performance_analysis",
                                   "rr_k_ml.RData")
    save(rr_k_ml,
         file = results_file_path)
  }
  if (args[3] == "rr_lambda_a") {
    rr_lambda_a_ml <- DAISIE_ML_CS(
      datalist = sim[[1]],
      initparsopt = c(1, 1, 30, 0.01, 1, sd[i]),
      idparsopt = 1:6,
      parsfix = NULL,
      idparsfix = NULL,
      ddmodel = 11,
      optimmethod = "simplex",
      CS_version = create_CS_version(model = 2,
                                     relaxed_par = "anagenesis"))
    results_file_path <- file.path(getwd(), "results", "performance_analysis",
                                   "rr_lambda_a_ml.RData")
    save(rr_lambda_a_ml,
         file = results_file_path)
  }
}
