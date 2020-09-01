# Aldabra Group constant rate diversity-dependent no cladogenesis model

library(DAISIE)

data(Aldabra_Group)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
  init_param_set[[i]][6] <- runif(1, 0.1, 1)
}

Aldabra_Group_cr_dd_no_lambda_c_init <- list()
Aldabra_Group_cr_dd_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Aldabra_Group_cr_dd_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Aldabra_Group,
    initparsopt = c(init_param_set[[i]][2],
                    init_param_set[[i]][3],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5]),
    idparsopt = c(2, 3, 4, 5),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)

  Aldabra_Group_cr_dd_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Aldabra_Group,
    initparsopt = c(Aldabra_Group_cr_dd_no_lambda_c_init[[i]]$mu,
                    Aldabra_Group_cr_dd_no_lambda_c_init[[i]]$K,
                    Aldabra_Group_cr_dd_no_lambda_c_init[[i]]$gamma,
                    Aldabra_Group_cr_dd_no_lambda_c_init[[i]]$lambda_a),
    idparsopt = c(2, 3, 4, 5),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Aldabra_Group_cr_dd_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Aldabra_Group_cr_dd_no_lambda_c_max_loglik <-
  Aldabra_Group_cr_dd_no_lambda_c[[max_loglik]]

#Calculate BIC
Aldabra_Group_cr_dd_no_lambda_c_BIC <-
  4 * (log(1000) + log(2 * pi)) -
  2 * Aldabra_Group_cr_dd_no_lambda_c[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Aldabra_Group",
                               "Aldabra_Group_cr_dd_no_lambda_c.RData")
Aldabra_Group_cr_dd_no_lambda_c_results <- list(
  Aldabra_Group_cr_dd_no_lambda_c_max_loglik = Aldabra_Group_cr_dd_no_lambda_c_max_loglik,
  Aldabra_Group_cr_dd_no_lambda_c_BIC = Aldabra_Group_cr_dd_no_lambda_c_BIC)

save(Aldabra_Group_cr_dd_no_lambda_c_results,
     file = results_file_path)
