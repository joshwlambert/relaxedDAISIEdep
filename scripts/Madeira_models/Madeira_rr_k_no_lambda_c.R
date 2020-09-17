# Madeira relaxed rate carrying capacity no cladogenesis model

library(DAISIE)

data(Madeira)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
  init_param_set[[i]][6] <- runif(1, 0.1, 1)
}

Madeira_rr_k_no_lambda_c_init <- list()
Madeira_rr_k_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Madeira_rr_k_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Madeira,
    initparsopt = c(init_param_set[[i]][2],
                    init_param_set[[i]][3],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5],
                    init_param_set[[i]][6]),
    idparsopt = c(2, 3, 4, 5, 6),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "carrying_capacity"))

  Madeira_rr_k_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Madeira,
    initparsopt = c(Madeira_rr_k_no_lambda_c_init[[i]]$mu,
                    Madeira_rr_k_no_lambda_c_init[[i]]$K,
                    Madeira_rr_k_no_lambda_c_init[[i]]$gamma,
                    Madeira_rr_k_no_lambda_c_init[[i]]$lambda_a,
                    Madeira_rr_k_no_lambda_c_init[[i]]$sd),
    idparsopt = c(2, 3, 4, 5, 6),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "carrying_capacity"))
}

#Extract global optima
loglik <- sapply(Madeira_rr_k_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Madeira_rr_k_no_lambda_c_max_loglik <- Madeira_rr_k_no_lambda_c[[max_loglik]]

#Calculate BIC
Madeira_rr_k_no_lambda_c_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Madeira_rr_k_no_lambda_c[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Madeira",
                               "Madeira_rr_k_no_lambda_c.RData")
Madeira_rr_k_no_lambda_c_results <- list(
  Madeira_rr_k_no_lambda_c_max_loglik = Madeira_rr_k_no_lambda_c_max_loglik,
  Madeira_rr_k_no_lambda_c_BIC = Madeira_rr_k_no_lambda_c_BIC)

save(Madeira_rr_k_no_lambda_c_results,
     file = results_file_path)
