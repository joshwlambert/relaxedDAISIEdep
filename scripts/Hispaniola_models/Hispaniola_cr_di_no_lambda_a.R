# Hispaniola constant rate diversity-independent no anagenesis model

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

Hispaniola_cr_di_no_lambda_a_init <- list()
Hispaniola_cr_di_no_lambda_a <- list()

for (i in seq_along(init_param_set)) {
  Hispaniola_cr_di_no_lambda_a_init[[i]] <- DAISIE_ML_CS(
    datalist = Hispaniola,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][4]),
    idparsopt = c(1, 2, 4),
    parsfix = c(Inf, 0),
    idparsfix = c(3, 5),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)

  Hispaniola_cr_di_no_lambda_a[[i]] <- DAISIE_ML_CS(
    datalist = Hispaniola,
    initparsopt = c(Hispaniola_cr_di_no_lambda_a_init[[i]]$lambda_c,
                    Hispaniola_cr_di_no_lambda_a_init[[i]]$mu,
                    Hispaniola_cr_di_no_lambda_a_init[[i]]$gamma),
    idparsopt = c(1, 2, 4),
    parsfix = c(Inf, 0),
    idparsfix = c(3, 5),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Hispaniola_cr_di_no_lambda_a, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Hispaniola_cr_di_no_lambda_a_max_loglik <- Hispaniola_cr_di_no_lambda_a[[max_loglik]]

#Calculate BIC
Hispaniola_cr_di_no_lambda_a_BIC <-
  3 * (log(300) + log(2 * pi)) -
  2 * Hispaniola_cr_di_no_lambda_a[[max_loglik]]$loglik
