# Norfolk relaxed rate extinction diversity-independent no cladogenesis model

library(DAISIE)

data(Norfolk)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
  init_param_set[[i]][6] <- runif(1, 0.1, 1)
}

Norfolk_rr_mu_di_no_lambda_c_init <- list()
Norfolk_rr_mu_di_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Norfolk_rr_mu_di_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Norfolk,
    initparsopt = c(init_param_set[[i]][2],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5],
                    init_param_set[[i]][6]),
    idparsopt = c(2, 4, 5, 6),
    parsfix = c(0, Inf),
    idparsfix = c(1, 3),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "extinction"))

  Norfolk_rr_mu_di_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Norfolk,
    initparsopt = c(Norfolk_rr_mu_di_no_lambda_c_init[[i]]$mu,
                    Norfolk_rr_mu_di_no_lambda_c_init[[i]]$gamma,
                    Norfolk_rr_mu_di_no_lambda_c_init[[i]]$lambda_a,
                    Norfolk_rr_mu_di_no_lambda_c_init[[i]]$sd),
    idparsopt = c(2, 4, 5, 6),
    parsfix = c(0, Inf),
    idparsfix = c(1, 3),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "extinction"))
}

#Extract global optima
loglik <- sapply(Norfolk_rr_mu_di_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Norfolk_rr_mu_di_no_lambda_c_max_loglik <-
  Norfolk_rr_mu_di_no_lambda_c[[max_loglik]]

#Calculate BIC
Norfolk_rr_mu_di_no_lambda_c_BIC <-
  4 * (log(1000) + log(2 * pi)) -
  2 * Norfolk_rr_mu_di_no_lambda_c[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Norfolk",
                               "Norfolk_rr_mu_di_no_lambda_c.RData")
Norfolk_rr_mu_di_no_lambda_c_results <- list(
  Norfolk_rr_mu_di_no_lambda_c_max_loglik = Norfolk_rr_mu_di_no_lambda_c_max_loglik,
  Norfolk_rr_mu_di_no_lambda_c_BIC = Norfolk_rr_mu_di_no_lambda_c_BIC)

save(Norfolk_rr_mu_di_no_lambda_c_results,
     file = results_file_path)
