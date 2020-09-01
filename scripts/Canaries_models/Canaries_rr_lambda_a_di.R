# Canaries relaxed rate anagenesis diversity-independent model

library(DAISIE)

data(Canaries)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
  init_param_set[[i]][6] <- runif(1, 0.1, 1)
}

Canaries_rr_lambda_a_di_init <- list()
Canaries_rr_lambda_a_di <- list()

for (i in seq_along(init_param_set)) {
  Canaries_rr_lambda_a_di_init[[i]] <- DAISIE_ML_CS(
    datalist = Canaries,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5],
                    init_param_set[[i]][6]),
    idparsopt = c(1, 2, 4, 5, 6),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "anagenesis"))

  Canaries_rr_lambda_a_di[[i]] <- DAISIE_ML_CS(
    datalist = Canaries,
    initparsopt = c(Canaries_rr_lambda_a_di_init[[i]]$lambda_c,
                    Canaries_rr_lambda_a_di_init[[i]]$mu,
                    Canaries_rr_lambda_a_di_init[[i]]$gamma,
                    Canaries_rr_lambda_a_di_init[[i]]$lambda_a,
                    Canaries_rr_lambda_a_di_init[[i]]$sd),
    idparsopt = c(1, 2, 4, 5, 6),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "anagenesis"))
}

#Extract global optima
loglik <- sapply(Canaries_rr_lambda_a_di, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Canaries_rr_lambda_a_di_max_loglik <-
  Canaries_rr_lambda_a_di[[max_loglik]]

#Calculate BIC
Canaries_rr_lambda_a_di_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Canaries_rr_lambda_a_di[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Canaries",
                               "Canaries_rr_lambda_a_di.RData")
Canaries_rr_lambda_a_di_results <- list(
  Canaries_rr_lambda_a_di_max_loglik = Canaries_rr_lambda_a_di_max_loglik,
  Canaries_rr_lambda_a_di_BIC = Canaries_rr_lambda_a_di_BIC)

save(Canaries_rr_lambda_a_di_results,
     file = results_file_path)
