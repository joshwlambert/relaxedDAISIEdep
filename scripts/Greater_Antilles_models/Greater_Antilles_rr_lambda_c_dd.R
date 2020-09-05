# Greater Antilles relaxed rate cladogenesis diversity-dependent model

library(DAISIE)

data(Greater_Antilles)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
  init_param_set[[i]][6] <- runif(1, 0.1, 1)
}

Greater_Antilles_rr_lambda_c_dd_init <- list()
Greater_Antilles_rr_lambda_c_dd <- list()

for (i in seq_along(init_param_set)) {
  Greater_Antilles_rr_lambda_c_dd_init[[i]] <- DAISIE_ML_CS(
    datalist = Greater_Antilles,
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
                                           relaxed_par = "cladogenesis"))

  Greater_Antilles_rr_lambda_c_dd[[i]] <- DAISIE_ML_CS(
    datalist = Greater_Antilles,
    initparsopt = c(Greater_Antilles_rr_lambda_c_dd_init[[i]]$lambda_c,
                    Greater_Antilles_rr_lambda_c_dd_init[[i]]$mu,
                    Greater_Antilles_rr_lambda_c_dd_init[[i]]$K,
                    Greater_Antilles_rr_lambda_c_dd_init[[i]]$gamma,
                    Greater_Antilles_rr_lambda_c_dd_init[[i]]$lambda_a,
                    Greater_Antilles_rr_lambda_c_dd_init[[i]]$sd),
    idparsopt = c(1, 2, 3, 4, 5, 6),
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "cladogenesis"))
}

#Extract global optima
loglik <- sapply(Greater_Antilles_rr_lambda_c_dd, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Greater_Antilles_rr_lambda_c_dd <-
  Greater_Antilles_rr_lambda_c_dd[[max_loglik]]

#Calculate BIC
Greater_Antilles_rr_lambda_c_dd_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Greater_Antilles_rr_lambda_c_dd[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Greater_Antilles",
                               "Greater_Antilles_rr_lambda_c_dd.RData")
Greater_Antilles_rr_lambda_c_dd_results <- list(
  Greater_Antilles_rr_lambda_c_dd_max_loglik = Greater_Antilles_rr_lambda_c_dd_max_loglik,
  Greater_Antilles_rr_lambda_c_dd_BIC = Greater_Antilles_rr_lambda_c_dd_BIC)

save(Greater_Antilles_rr_lambda_c_dd_results,
     file = results_file_path)
