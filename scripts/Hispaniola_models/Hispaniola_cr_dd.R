# Hispaniola constant rate diversity-dependent model

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

Hispaniola_cr_dd_init <- list()
Hispaniola_cr_dd <- list()

for (i in seq_along(init_param_set)) {
  Hispaniola_cr_dd_init[[i]] <- DAISIE_ML_CS(
    datalist = Hispaniola,
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
}

for (i in 1:2) {
  Hispaniola_cr_dd[[i]] <- DAISIE_ML_CS(
    datalist = Hispaniola,
    initparsopt = c(Hispaniola_cr_dd_init[[i]]$lambda_c,
                    Hispaniola_cr_dd_init[[i]]$mu,
                    Hispaniola_cr_dd_init[[i]]$K,
                    Hispaniola_cr_dd_init[[i]]$gamma,
                    Hispaniola_cr_dd_init[[i]]$lambda_a),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

for (i in 3:9) {
  Hispaniola_cr_dd[[i]] <- DAISIE_ML_CS(
    datalist = Hispaniola,
    initparsopt = c(Hispaniola_cr_dd_init[[i]]$lambda_c,
                    Hispaniola_cr_dd_init[[i]]$mu,
                    Hispaniola_cr_dd_init[[i]]$K,
                    Hispaniola_cr_dd_init[[i]]$gamma,
                    Hispaniola_cr_dd_init[[i]]$lambda_a),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}


Hispaniola_cr_dd[[10]] <- DAISIE_ML_CS(
  datalist = Hispaniola,
  initparsopt = c(Hispaniola_cr_dd_init[[10]]$lambda_c,
                  Hispaniola_cr_dd_init[[10]]$mu,
                  Hispaniola_cr_dd_init[[10]]$K,
                  Hispaniola_cr_dd_init[[10]]$gamma,
                  Hispaniola_cr_dd_init[[10]]$lambda_a),
  idparsopt = 1:5,
  parsfix = NULL,
  idparsfix = NULL,
  ddmodel = 11,
  optimmethod = "simplex",
  CS_version = 1)

#Extract global optima
loglik <- unlist(sapply(Hispaniola_cr_dd, '[[', 6))
max_loglik <- which(max(loglik) == loglik)
Hispaniola_cr_dd_max_loglik <- Hispaniola_cr_dd[[max_loglik]]

#Calculate BIC
Hispaniola_cr_dd_BIC <-
  5 * (log(300) + log(2 * pi)) - 2 * Hispaniola_cr_dd[[max_loglik]]$loglik
