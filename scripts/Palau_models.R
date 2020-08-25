### Palau models ###
# sample size, should be the same as M

library(DAISIE)

data(Palau)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
}

### Constant rate diversity-independent model ###

Palau_cr_di_init <- list()

for (i in seq_along(init_param_set)) {
  Palau_cr_di_init[[i]] <- DAISIE_ML_CS(
    datalist = Palau,
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

Palau_cr_di <- list()

for (i in seq_along(init_param_set)) {
  Palau_cr_di[[i]] <- DAISIE_ML_CS(
    datalist = Palau,
    initparsopt = c(Palau_cr_di_init[[i]]$lambda_c,
                    Palau_cr_di_init[[i]]$mu,
                    Palau_cr_di_init[[i]]$gamma,
                    Palau_cr_di_init[[i]]$lambda_a),
    idparsopt = c(1, 2, 4, 5),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Palau_cr_di, '[[', 6)
max_loglik <- which(max(loglik) == loglik)

#Calculate BIC
BIC <- 4 * (log(1000) + log(2 * pi)) - 2 * Palau_cr_di[[max_loglik]]$loglik

### Constant rate diversity-dependent model ###

Palau_cr_dd_init <- list()

for (i in seq_along(init_param_set)) {
  Palau_cr_dd_init[[i]] <- DAISIE_ML_CS(
    datalist = Palau,
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

Palau_cr_dd <- list()

for (i in seq_along(init_param_set)) {
  Palau_cr_dd[[i]] <- DAISIE_ML_CS(
    datalist = Palau,
    initparsopt = c(Palau_cr_dd_init[[i]]$lambda_c,
                    Palau_cr_dd_init[[i]]$mu,
                    Palau_cr_dd_init[[i]]$K,
                    Palau_cr_dd_init[[i]]$gamma,
                    Palau_cr_dd_init[[i]]$lambda_a),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Palau_cr_dd, '[[', 6)
max_loglik <- which(max(loglik) == loglik)

#Calculate BIC
BIC <- 5 * (log(1000) + log(2 * pi)) - 2 * Palau_cr_dd[[max_loglik]]$loglik

### Constant rate diversity-independent no cladogenesis model ###

Palau_cr_di_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Palau_cr_di_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Palau,
    initparsopt = c(init_param_set[[i]][2],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5]),
    idparsopt = c(2, 4, 5),
    parsfix = c(0, Inf),
    idparsfix = c(1, 3),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

Palau_cr_di_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Palau_cr_di_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Palau,
    initparsopt = c(Palau_cr_di_no_lambda_c_init[[i]]$mu,
                    Palau_cr_di_no_lambda_c_init[[i]]$gamma,
                    Palau_cr_di_no_lambda_c_init[[i]]$lambda_a),
    idparsopt = c(2, 4, 5),
    parsfix = c(0, Inf),
    idparsfix = c(1, 3),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Palau_cr_di_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)

#Calculate BIC
BIC <- 3 * (log(1000) + log(2 * pi)) - 2 * Palau_cr_di_no_lambda_c[[max_loglik]]$loglik

### Constant rate diversity-dependent no cladogenesis model ###

Palau_cr_dd_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Palau_cr_dd_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Palau,
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
}

Palau_cr_dd_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Palau_cr_dd_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Palau,
    initparsopt = c(Palau_cr_dd_no_lambda_c_init[[i]]$mu,
                    Palau_cr_dd_no_lambda_c_init[[i]]$K,
                    Palau_cr_dd_no_lambda_c_init[[i]]$gamma,
                    Palau_cr_dd_no_lambda_c_init[[i]]$lambda_a),
    idparsopt = c(2, 3, 4, 5),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Palau_cr_dd_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)

#Calculate BIC
BIC <- 4 * (log(1000) + log(2 * pi)) - 2 * Palau_cr_dd_no_lambda_c[[max_loglik]]$loglik
