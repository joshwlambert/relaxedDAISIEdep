### Hispaniola models ###
# sample size, should be the same as M

library(DAISIE)

data(Hispaniola)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
}

### Constant rate diversity-independent model ###

Hispaniola_cr_di_init <- list()

for (i in seq_along(init_param_set)) {
  Hispaniola_cr_di_init[[i]] <- DAISIE_ML_CS(
    datalist = Hispaniola,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5]),
    idparsopt = c(1, 2, 4, 5),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

Hispaniola_cr_di <- list()

for (i in seq_along(init_param_set)) {
  Hispaniola_cr_di[[i]] <- DAISIE_ML_CS(
    datalist = Hispaniola,
    initparsopt = c(Hispaniola_cr_di_init[[i]]$lambda_c,
                    Hispaniola_cr_di_init[[i]]$mu,
                    Hispaniola_cr_di_init[[i]]$gamma,
                    Hispaniola_cr_di_init[[i]]$lambda_a),
    idparsopt = c(1, 2, 4, 5),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Hispaniola_cr_di, '[[', 6)
max_loglik <- which(max(loglik) == loglik)

#Calculate BIC
BIC <- 4 * log(300) - 2 * Hispaniola_cr_di[[max_loglik]]$loglik

### Constant rate diversity-dependent model ###

Hispaniola_cr_dd_init <- list()

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

Hispaniola_cr_dd <- list()

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

#Calculate BIC
BIC <- 5 * log(300) - 2 * Hispaniola_cr_dd[[max_loglik]]$loglik

### Constant rate diversity-independent no anagenesis model ###

Hispaniola_cr_di_no_lambda_a_init <- list()

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
}

Hispaniola_cr_di_no_lambda_a <- list()

for (i in seq_along(init_param_set)) {
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

#Calculate BIC
BIC <- 3 * log(300) - 2 * Hispaniola_cr_di_no_lambda_a[[max_loglik]]$loglik

### Constant rate diversity-dependent no anagenesis model ###

Hispaniola_cr_dd_no_lambda_a_init <- list()

for (i in seq_along(init_param_set)) {
  Hispaniola_cr_dd_no_lambda_a_init[[i]] <- DAISIE_ML_CS(
    datalist = Hispaniola,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][3],
                    init_param_set[[i]][4]),
    idparsopt = 1:4,
    parsfix = 0,
    idparsfix = 5,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

Hispaniola_cr_dd_no_lambda_a <- list()

for (i in 1:8) {
  Hispaniola_cr_dd_no_lambda_a[[i]] <- DAISIE_ML_CS(
    datalist = Hispaniola,
    initparsopt = c(Hispaniola_cr_dd_no_lambda_a_init[[i]]$lambda_c,
                    Hispaniola_cr_dd_no_lambda_a_init[[i]]$mu,
                    Hispaniola_cr_dd_no_lambda_a_init[[i]]$K,
                    Hispaniola_cr_dd_no_lambda_a_init[[i]]$gamma),
    idparsopt = 1:4,
    parsfix = 0,
    idparsfix = 5,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

for (i in 9:10) {
  Hispaniola_cr_dd_no_lambda_a[[i]] <- DAISIE_ML_CS(
    datalist = Hispaniola,
    initparsopt = c(Hispaniola_cr_dd_no_lambda_a_init[[i]]$lambda_c,
                    Hispaniola_cr_dd_no_lambda_a_init[[i]]$mu,
                    Hispaniola_cr_dd_no_lambda_a_init[[i]]$K,
                    Hispaniola_cr_dd_no_lambda_a_init[[i]]$gamma),
    idparsopt = 1:4,
    parsfix = 0,
    idparsfix = 5,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}


#Extract global optima
loglik <- unlist(sapply(Hispaniola_cr_dd_no_lambda_a, '[[', 6))
max_loglik <- which(max(loglik) == loglik)

#Calculate BIC
BIC <- 4 * log(300) - 2 * Hispaniola_cr_dd_no_lambda_a[[max_loglik]]$loglik
