# Chatham constant rate diversity-dependent model

library(DAISIE)

data(Chatham)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
  init_param_set[[i]][6] <- runif(1, 0.1, 1)
}

Chatham_cr_dd_init <- list()
Chatham_cr_dd <- list()

for (i in seq_along(init_param_set)) {
  Chatham_cr_dd_init[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][3],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5]),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)

  Chatham_cr_dd[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
    initparsopt = c(Chatham_cr_dd_init[[i]]$lambda_c,
                    Chatham_cr_dd_init[[i]]$mu,
                    Chatham_cr_dd_init[[i]]$K,
                    Chatham_cr_dd_init[[i]]$gamma,
                    Chatham_cr_dd_init[[i]]$lambda_a),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Chatham_cr_dd, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Chatham_cr_dd_max_loglik <- Chatham_cr_dd[[max_loglik]]

#Calculate BIC
Chatham_cr_dd_BIC <-
  5 * (log(1000) + log(2 * pi)) - 2 * Chatham_cr_dd[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Chatham",
                               "Chatham_cr_dd.RData")
Chatham_cr_dd_results <- list(
  Chatham_cr_dd_max_loglik = Chatham_cr_dd_max_loglik,
  Chatham_cr_dd_BIC = Chatham_cr_dd_BIC)

save(Chatham_cr_dd_results,
     file = results_file_path)
