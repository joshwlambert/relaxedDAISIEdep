# Comoros relaxed rate extinction diversity-independent model

library(DAISIE)

data(Comoros)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
  init_param_set[[i]][6] <- runif(1, 0.1, 1)
}

Comoros_rr_mu_di_init <- list()
Comoros_rr_mu_di <- list()

for (i in seq_along(init_param_set)) {
  Comoros_rr_mu_di_init[[i]] <- DAISIE_ML_CS(
    datalist = Comoros,
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
                                           relaxed_par = "extinction"))

  Comoros_rr_mu_di[[i]] <- DAISIE_ML_CS(
    datalist = Comoros,
    initparsopt = c(Comoros_rr_mu_di_init[[i]]$lambda_c,
                    Comoros_rr_mu_di_init[[i]]$mu,
                    Comoros_rr_mu_di_init[[i]]$gamma,
                    Comoros_rr_mu_di_init[[i]]$lambda_a,
                    Comoros_rr_mu_di_init[[i]]$sd),
    idparsopt = c(1, 2, 4, 5, 6),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "extinction"))
}

#Extract global optima
loglik <- sapply(Comoros_rr_mu_di, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Comoros_rr_mu_di_max_loglik <-
  Comoros_rr_mu_di[[max_loglik]]

#Calculate BIC
Comoros_rr_mu_di_BIC <-
  4 * (log(1000) + log(2 * pi)) - 2 * Comoros_rr_mu_di[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Comoros",
                               "Comoros_rr_mu_di.RData")
Comoros_rr_mu_di_results <- list(
  Comoros_rr_mu_di_max_loglik = Comoros_rr_mu_di_max_loglik,
  Comoros_rr_mu_di_BIC = Comoros_rr_mu_di_BIC)

save(Comoros_rr_mu_di_results,
     file = results_file_path)
