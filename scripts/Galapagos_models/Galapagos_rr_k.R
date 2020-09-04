# Galapagos relaxed rate carrying capacity model

library(DAISIE)

data(Galapagos)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
  init_param_set[[i]][6] <- runif(1, 0.1, 1)
}

Galapagos_rr_k_init <- list()
Galapagos_rr_k <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_k_init[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][3],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5],
                    init_param_set[[i]][6]),
    idparsopt = c(1, 2, 3, 4, 5, 6),
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "carrying_capacity"))

  Galapagos_rr_k[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_rr_k_init[[i]]$lambda_c,
                    Galapagos_rr_k_init[[i]]$mu,
                    Galapagos_rr_k_init[[i]]$K,
                    Galapagos_rr_k_init[[i]]$gamma,
                    Galapagos_rr_k_init[[i]]$lambda_a,
                    Galapagos_rr_k_init[[i]]$sd),
    idparsopt = c(1, 2, 3, 4, 5, 6),
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "carrying_capacity"))
}

#Extract global optima
loglik <- sapply(Galapagos_rr_k, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_rr_k_max_loglik <-
  Galapagos_rr_k[[max_loglik]]

#Calculate BIC
Galapagos_rr_k_BIC <-
  5 * (log(1000) + log(2 * pi)) - 2 * Galapagos_rr_k[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Galapagos",
                               "Galapagos_rr_k.RData")
Galapagos_rr_k_results <- list(
  Galapagos_rr_k_max_loglik = Galapagos_rr_k_max_loglik,
  Galapagos_rr_k_BIC = Galapagos_rr_k_BIC)

save(Galapagos_rr_k_results,
     file = results_file_path)
