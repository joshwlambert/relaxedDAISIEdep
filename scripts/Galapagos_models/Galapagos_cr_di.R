# Galapagos constant rate diversity-independent model

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

Galapagos_cr_di_init <- list()
Galapagos_cr_di <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_cr_di_init[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5]),
    idparsopt = c(1, 2, 4, 5),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)

  Galapagos_cr_di[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_cr_di_init[[i]]$lambda_c,
                    Galapagos_cr_di_init[[i]]$mu,
                    Galapagos_cr_di_init[[i]]$gamma,
                    Galapagos_cr_di_init[[i]]$lambda_a),
    idparsopt = c(1, 2, 4, 5),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Galapagos_cr_di, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_cr_di_max_loglik <- Galapagos_cr_di[[max_loglik]]

#Calculate BIC
Galapagos_cr_di_BIC <-
  4 * (log(1000) + log(2 * pi)) - 2 * Galapagos_cr_di[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Galapagos",
                               "Galapagos_cr_di.RData")
Galapagos_cr_di_results <- list(
  Galapagos_cr_di_max_loglik = Galapagos_cr_di_max_loglik,
  Galapagos_cr_di_BIC = Galapagos_cr_di_BIC)

save(Galapagos_cr_di_results,
     file = results_file_path)
