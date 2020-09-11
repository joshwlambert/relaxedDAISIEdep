# Hispaniola relaxed-rate cladogenesis diversity-independent no angenesis model

library(DAISIE)

data(Hispaniola)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
  init_param_set[[i]][6] <- runif(1, 0.1, 1)
}

Hispaniola_rr_lambda_c_di_no_lambda_a_init <- list()
Hispaniola_rr_lambda_c_di_no_lambda_a <- list()

for (i in seq_along(init_param_set)) {
  Hispaniola_rr_lambda_c_di_no_lambda_a_init[[i]] <- DAISIE_ML_CS(
    datalist = Hispaniola,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][4],
                    init_param_set[[i]][6]),
    idparsopt = c(1, 2, 4, 6),
    parsfix = c(Inf, 0),
    idparsfix = c(3, 5),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "cladogenesis"))

  Hispaniola_rr_lambda_c_di_no_lambda_a[[i]] <- DAISIE_ML_CS(
    datalist = Hispaniola,
    initparsopt = c(Hispaniola_rr_lambda_c_di_no_lambda_a_init[[i]]$lambda_c,
                    Hispaniola_rr_lambda_c_di_no_lambda_a_init[[i]]$mu,
                    Hispaniola_rr_lambda_c_di_no_lambda_a_init[[i]]$gamma,
                    Hispaniola_rr_lambda_c_di_no_lambda_a_init[[i]]$sd),
    idparsopt = c(1, 2, 3, 4, 6),
    parsfix = c(Inf, 0),
    idparsfix = c(3, 5),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "cladogenesis"))
}

#Extract global optima
loglik <- sapply(Hispaniola_rr_lambda_c_di_no_lambda_a, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Hispaniola_rr_lambda_c_di_no_lambda_a_max_loglik <-
  Hispaniola_rr_lambda_c_di_no_lambda_a[[max_loglik]]

#Calculate BIC
Hispaniola_rr_lambda_c_di_no_lambda_a_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Hispaniola_rr_lambda_c_di_no_lambda_a[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Hispaniola",
                               "Hispaniola_rr_lambda_c_di_no_lambda_a.RData")
Hispaniola_rr_lambda_c_di_no_lambda_a_results <- list(
  Hispaniola_rr_lambda_c_di_no_lambda_a_max_loglik = Hispaniola_rr_lambda_c_no_lambda_a_max_loglik,
  Hispaniola_rr_lambda_c_di_no_lambda_a_BIC = Hispaniola_rr_lambda_c_di_no_lambda_a_BIC)

save(Hispaniola_rr_lambda_c_di_no_lambda_a_results,
     file = results_file_path)
