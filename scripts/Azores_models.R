### Azores models ###
# sample size, should be the same as M

library(DAISIE)

data(Azores)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
  init_param_set[[i]][6] <- runif(1, 0.1, 1)
}

### Constant rate diversity-independent model ###

Azores_cr_di_init <- list()

for (i in seq_along(init_param_set)) {
  Azores_cr_di_init[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
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

Azores_cr_di <- list()

for (i in seq_along(init_param_set)) {
  Azores_cr_di[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
    initparsopt = c(Azores_cr_di_init[[i]]$lambda_c,
                    Azores_cr_di_init[[i]]$mu,
                    Azores_cr_di_init[[i]]$gamma,
                    Azores_cr_di_init[[i]]$lambda_a),
    idparsopt = c(1, 2, 4, 5),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Azores_cr_di, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Azores_cr_di_max_loglik <- Azores_cr_di[[max_loglik]]

#Calculate BIC
Azores_cr_di_BIC <-
  4 * (log(1000) + log(2 * pi)) - 2 * Azores_cr_di[[max_loglik]]$loglik

### Constant rate diversity-dependent model ###

Azores_cr_dd_init <- list()

for (i in seq_along(init_param_set)) {
  Azores_cr_dd_init[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
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

Azores_cr_dd <- list()

for (i in seq_along(init_param_set)) {
  Azores_cr_dd[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
    initparsopt = c(Azores_cr_dd_init[[i]]$lambda_c,
                    Azores_cr_dd_init[[i]]$mu,
                    Azores_cr_dd_init[[i]]$K,
                    Azores_cr_dd_init[[i]]$gamma,
                    Azores_cr_dd_init[[i]]$lambda_a),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Azores_cr_dd, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Azores_cr_dd_max_loglik <- Azores_cr_dd[[max_loglik]]

#Calculate BIC
Azores_cr_dd_BIC <-
  5 * (log(1000) + log(2 * pi)) - 2 * Azores_cr_dd[[max_loglik]]$loglik

### Constant rate diversity-independent no cladogenesis model ###

Azores_cr_di_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Azores_cr_di_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
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

Azores_cr_di_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Azores_cr_di_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
    initparsopt = c(Azores_cr_di_no_lambda_c_init[[i]]$mu,
                    Azores_cr_di_no_lambda_c_init[[i]]$gamma,
                    Azores_cr_di_no_lambda_c_init[[i]]$lambda_a),
    idparsopt = c(2, 4, 5),
    parsfix = c(0, Inf),
    idparsfix = c(1, 3),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Azores_cr_di_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Azores_cr_di_no_lambda_c_max_loglik <- Azores_cr_di_no_lambda_c[[max_loglik]]

#Calculate BIC
Azores_cr_di_no_lambda_c_BIC <-
  3 * (log(1000) + log(2 * pi)) -
  2 * Azores_cr_di_no_lambda_c[[max_loglik]]$loglik

### Constant rate diversity-dependent no cladogenesis model ###

Azores_cr_dd_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Azores_cr_dd_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
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

Azores_cr_dd_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Azores_cr_dd_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
    initparsopt = c(Azores_cr_dd_no_lambda_c_init[[i]]$mu,
                    Azores_cr_dd_no_lambda_c_init[[i]]$K,
                    Azores_cr_dd_no_lambda_c_init[[i]]$gamma,
                    Azores_cr_dd_no_lambda_c_init[[i]]$lambda_a),
    idparsopt = c(2, 3, 4, 5),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Azores_cr_dd_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Azores_cr_dd_no_lambda_c_max_loglik <- Azores_cr_dd_no_lambda_c[[max_loglik]]

#Calculate BIC
Azores_cr_dd_no_lambda_c_BIC <-
  4 * (log(1000) + log(2 * pi)) -
  2 * Azores_cr_dd_no_lambda_c[[max_loglik]]$loglik

### Relaxed rate extinction diversity-independent no cladogenesis model ###

Azores_rr_mu_di_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Azores_rr_mu_di_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
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
}

Azores_rr_mu_di_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Azores_rr_mu_di_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
    initparsopt = c(Azores_rr_mu_di_no_lambda_c_init[[i]]$mu,
                    Azores_rr_mu_di_no_lambda_c_init[[i]]$gamma,
                    Azores_rr_mu_di_no_lambda_c_init[[i]]$lambda_a,
                    Azores_rr_mu_di_no_lambda_c_init[[i]]$sd),
    idparsopt = c(2, 4, 5, 6),
    parsfix = c(0, Inf),
    idparsfix = c(1, 3),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "extinction"))
}

#Extract global optima
loglik <- sapply(Azores_rr_mu_di_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Azores_rr_mu_di_no_lambda_c_max_loglik <-
  Azores_rr_mu_di_no_lambda_c[[max_loglik]]

#Calculate BIC
Azores_rr_mu_di_no_lambda_c_BIC <-
  4 * (log(1000) + log(2 * pi)) -
  2 * Azores_rr_mu_di_no_lambda_c[[max_loglik]]$loglik

### Relaxed rate extinction diversity-dependent no cladogenesis model ###

Azores_rr_mu_dd_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Azores_rr_mu_dd_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
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
                                           relaxed_par = "extinction"))
}

Azores_rr_mu_dd_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Azores_rr_mu_dd_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
    initparsopt = c(Azores_rr_mu_dd_no_lambda_c_init[[i]]$mu,
                    Azores_rr_mu_dd_no_lambda_c_init[[i]]$K,
                    Azores_rr_mu_dd_no_lambda_c_init[[i]]$gamma,
                    Azores_rr_mu_dd_no_lambda_c_init[[i]]$lambda_a,
                    Azores_rr_mu_dd_no_lambda_c_init[[i]]$sd),
    idparsopt = c(2, 3, 4, 5, 6),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "extinction"))
}

#Extract global optima
loglik <- sapply(Azores_rr_mu_dd_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Azores_rr_mu_dd_no_lambda_c_max_loglik <-
  Azores_rr_mu_dd_no_lambda_c[[max_loglik]]

#Calculate BIC
Azores_rr_mu_dd_no_lambda_c_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Azores_rr_mu_dd_no_lambda_c[[max_loglik]]$loglik

### Relaxed rate carrying capacity no cladogenesis model ###

Azores_rr_k_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Azores_rr_k_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
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
}

Azores_rr_k_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Azores_rr_k_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
    initparsopt = c(Azores_rr_mu_dd_no_lambda_c_init[[i]]$mu,
                    Azores_rr_mu_dd_no_lambda_c_init[[i]]$K,
                    Azores_rr_mu_dd_no_lambda_c_init[[i]]$gamma,
                    Azores_rr_mu_dd_no_lambda_c_init[[i]]$lambda_a,
                    Azores_rr_mu_dd_no_lambda_c_init[[i]]$sd),
    idparsopt = c(2, 3, 4, 5, 6),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "carrying_capacity"))
}

#Extract global optima
loglik <- sapply(Azores_rr_k_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Azores_rr_k_no_lambda_c_max_loglik <-
  Azores_rr_k_no_lambda_c[[max_loglik]]

#Calculate BIC
Azores_rr_k_no_lambda_c_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Azores_rr_k_no_lambda_c[[max_loglik]]$loglik

### Relaxed rate anagenesis diversity-independent no cladogenesis model ###

Azores_rr_lambda_a_di_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Azores_rr_lambda_a_di_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
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
                                           relaxed_par = "anagenesis"))
}

Azores_rr_lambda_a_di_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Azores_rr_lambda_a_di_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
    initparsopt = c(Azores_rr_lambda_a_di_no_lambda_c_init[[i]]$mu,
                    Azores_rr_lambda_a_di_no_lambda_c_init[[i]]$K,
                    Azores_rr_lambda_a_di_no_lambda_c_init[[i]]$gamma,
                    Azores_rr_lambda_a_di_no_lambda_c_init[[i]]$lambda_a,
                    Azores_rr_lambda_a_di_no_lambda_c_init[[i]]$sd),
    idparsopt = c(2, 3, 4, 5, 6),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "anagenesis"))
}

#Extract global optima
loglik <- sapply(Azores_rr_lambda_a_di_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Azores_rr_lambda_a_di_no_lambda_c_max_loglik <-
  Azores_rr_lambda_a_di_no_lambda_c[[max_loglik]]

#Calculate BIC
Azores_rr_lambda_a_di_no_lambda_c_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Azores_rr_lambda_a_di_no_lambda_c[[max_loglik]]$loglik

### Relaxed rate anagenesis diversity-dependent no cladogenesis model ###

Azores_rr_lambda_a_dd_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Azores_rr_lambda_a_dd_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
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
                                           relaxed_par = "anagenesis"))
}

Azores_rr_lambda_a_dd_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Azores_rr_lambda_a_dd_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Azores,
    initparsopt = c(Azores_rr_lambda_a_dd_no_lambda_c_init[[i]]$mu,
                    Azores_rr_lambda_a_dd_no_lambda_c_init[[i]]$K,
                    Azores_rr_lambda_a_dd_no_lambda_c_init[[i]]$gamma,
                    Azores_rr_lambda_a_dd_no_lambda_c_init[[i]]$lambda_a,
                    Azores_rr_lambda_a_dd_no_lambda_c_init[[i]]$sd),
    idparsopt = c(2, 3, 4, 5, 6),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "anagenesis"))
}

#Extract global optima
loglik <- sapply(Azores_rr_lambda_a_dd_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Azores_rr_lambda_a_dd_no_lambda_c_max_loglik <-
  Azores_rr_lambda_a_dd_no_lambda_c[[max_loglik]]

#Calculate BIC
Azores_rr_lambda_a_dd_no_lambda_c_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Azores_rr_lambda_a_dd_no_lambda_c[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Azores.RData")
Azores_results <- list(
  Azores_cr_di_max_loglik = Azores_cr_di_max_loglik,
  Azores_cr_di_BIC = Azores_cr_di_BIC,
  Azores_cr_dd_max_loglik = Azores_cr_dd_max_loglik,
  Azores_cr_dd_BIC = Azores_cr_dd_BIC,
  Azores_cr_di_no_lambda_c_max_loglik = Azores_cr_di_no_lambda_c_max_loglik,
  Azores_cr_di_BIC = Azores_cr_di_BIC,
  Azores_cr_dd_no_lambda_c_max_loglik = Azores_cr_dd_no_lambda_c_max_loglik,
  Azores_cr_dd_no_lambda_c_BIC = Azores_cr_dd_no_lambda_c_BIC,
  Azores_rr_mu_di_no_lambda_c_max_loglik = Azores_rr_mu_di_no_lambda_c_max_loglik,
  Azores_rr_mu_di_no_lambda_c_BIC = Azores_rr_mu_di_no_lambda_c_BIC,
  Azores_rr_mu_dd_no_lambda_c_max_loglik = Azores_rr_mu_dd_no_lambda_c_max_loglik,
  Azores_rr_mu_dd_no_lambda_c_BIC = Azores_rr_mu_dd_no_lambda_c_BIC,
  Azores_rr_k_no_lambda_c_max_loglik = Azores_rr_k_no_lambda_c_max_loglik,
  Azores_rr_k_no_lambda_c_BIC = Azores_rr_k_no_lambda_c_BIC,
  Azores_rr_lambda_a_di_no_lambda_c_max_loglik = Azores_rr_lambda_a_di_no_lambda_c_max_loglik,
  Azores_rr_lambda_a_di_no_lambda_c_BIC = Azores_rr_lambda_a_di_no_lambda_c_BIC,
  Azores_rr_lambda_a_dd_no_lambda_c_max_loglik = Azores_rr_lambda_a_dd_no_lambda_c_max_loglik,
  Azores_rr_lambda_a_dd_no_lambda_c_BIC = Azores_rr_lambda_a_dd_no_lambda_c_BIC)

save(Azores_results,
     file = results_file_path)
