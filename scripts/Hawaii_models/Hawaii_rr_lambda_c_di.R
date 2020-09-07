# Hawaii relaxed rate cladogenesis diversity-independent model

library(DAISIE)

data(Hawaii)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
  init_param_set[[i]][6] <- runif(1, 0.1, 1)
}

Hawaii_rr_lambda_c_di_init <- list()
Hawaii_rr_lambda_c_di <- list()

for (i in seq_along(init_param_set)) {
  Hawaii_rr_lambda_c_di_init[[i]] <- DAISIE_ML_CS(
    datalist = Hawaii,
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
                                           relaxed_par = "cladogenesis"))

  Hawaii_rr_lambda_c_di[[i]] <- DAISIE_ML_CS(
    datalist = Hawaii,
    initparsopt = c(Hawaii_rr_lambda_c_di_init[[i]]$lambda_c,
                    Hawaii_rr_lambda_c_di_init[[i]]$mu,
                    Hawaii_rr_lambda_c_di_init[[i]]$gamma,
                    Hawaii_rr_lambda_c_di_init[[i]]$lambda_a,
                    Hawaii_rr_lambda_c_di_init[[i]]$sd),
    idparsopt = c(1, 2, 4, 5, 6),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "cladogenesis"))
}

#Extract global optima
loglik <- sapply(Hawaii_rr_lambda_c_di, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Hawaii_rr_lambda_c_di_max_loglik <-
  Hawaii_rr_lambda_c_di[[max_loglik]]

#Calculate BIC
Hawaii_rr_lambda_c_di_BIC <-
  4 * (log(1000) + log(2 * pi)) -
  2 * Hawaii_rr_lambda_c_di[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Hawaii",
                               "Hawaii_rr_lambda_c_di.RData")
Hawaii_rr_lambda_c_di_results <- list(
  Hawaii_rr_lambda_c_di_max_loglik = Hawaii_rr_lambda_c_di_max_loglik,
  Hawaii_rr_lambda_c_di_BIC = Hawaii_rr_lambda_c_di_BIC)

save(Hawaii_rr_lambda_c_di_results,
     file = results_file_path)
