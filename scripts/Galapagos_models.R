### Galapagos models ###
# sample size, should be the same as M

library(DAISIE)

data(Galapagos)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
  init_param_set[[i]][6] <- runif(1, 0.1, 1)
}

# Constant rate diversity-independent model -------------------------------

Galapagos_cr_di_init <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_cr_di_init[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
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

Galapagos_cr_di <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_cr_di[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_cr_di_init[[i]]$lambda_c,
                    Galapagos_cr_di_init[[i]]$mu,
                    Galapagos_cr_di_init[[i]]$gamma,
                    Galapagos_cr_di_init[[i]]$lambda_a),
    idparsopt = c(1, 2, 4, 5),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Galapagos_cr_di, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_cr_di_max_loglik <- Galapagos_cr_di[[max_loglik]]

#Calculate BIC
Galapagos_cr_di_BIC <-
  4 * (log(1000) + log(2 * pi)) - 2 * Galapagos_cr_di[[max_loglik]]$loglik

# Constant rate diversity-dependent model ---------------------------------

Galapagos_cr_dd_init <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_cr_dd_init[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
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

Galapagos_cr_dd <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_cr_dd[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_cr_dd_init[[i]]$lambda_c,
                    Galapagos_cr_dd_init[[i]]$mu,
                    Galapagos_cr_dd_init[[i]]$K,
                    Galapagos_cr_dd_init[[i]]$gamma,
                    Galapagos_cr_dd_init[[i]]$lambda_a),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Galapagos_cr_dd, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_cr_dd_max_loglik <- Galapagos_cr_dd[[max_loglik]]

#Calculate BIC
Galapagos_cr_dd_BIC <-
  5 * (log(1000) + log(2 * pi)) - 2 * Galapagos_cr_dd[[max_loglik]]$loglik

# Constant rate diversity-independent no anagenesis model -----------------

Galapagos_cr_di_no_lambda_a_init <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_cr_di_no_lambda_a_init[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
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

Galapagos_cr_di_no_lambda_a <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_cr_di_no_lambda_a[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_cr_di_no_lambda_a_init[[i]]$lambda_c,
                    Galapagos_cr_di_no_lambda_a_init[[i]]$mu,
                    Galapagos_cr_di_no_lambda_a_init[[i]]$gamma),
    idparsopt = c(1, 2, 4),
    parsfix = c(Inf, 0),
    idparsfix = c(3, 5),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Galapagos_cr_di_no_lambda_a, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_cr_di_no_lambda_a_max_loglik <-
  Galapagos_cr_di_no_lambda_a[[max_loglik]]

#Calculate BIC
Galapagos_cr_di_no_lambda_a_BIC <-
  3 * (log(1000) + log(2 * pi)) -
  2 * Galapagos_cr_di_no_lambda_a[[max_loglik]]$loglik

# Constant rate diversity-dependent no anagenesis model -------------------

Galapagos_cr_dd_no_lambda_a_init <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_cr_dd_no_lambda_a_init[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][3],
                    init_param_set[[i]][4]),
    idparsopt = c(1, 2, 3, 4),
    parsfix = 0,
    idparsfix = 5,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

Galapagos_cr_dd_no_lambda_a <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_cr_dd_no_lambda_a[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_cr_dd_no_lambda_a_init[[i]]$lambda_c,
                    Galapagos_cr_dd_no_lambda_a_init[[i]]$mu,
                    Galapagos_cr_dd_no_lambda_a_init[[i]]$K,
                    Galapagos_cr_dd_no_lambda_a_init[[i]]$gamma),
    idparsopt = c(1, 2, 3, 4),
    parsfix = 0,
    idparsfix = 5,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Galapagos_cr_dd_no_lambda_a, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_cr_dd_no_lambda_a_max_loglik <-
  Galapagos_cr_dd_no_lambda_a[[max_loglik]]

#Calculate BIC
Galapagos_cr_dd_no_lambda_a_BIC <-
  4 * (log(1000) + log(2 * pi)) -
  2 * Galapagos_cr_dd_no_lambda_a[[max_loglik]]$loglik

# Relaxed rate cladogenesis diversity-independent model -------------------

Galapagos_rr_lambda_c_di_init <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_lambda_c_di_init[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5],
                    init_param_set[[i]][6]),
    idparsopt = c(1, 2, 4, 5, 6),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "cladogenesis"))
}

Galapagos_rr_lambda_c_di <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_lambda_c_di[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_rr_lambda_c_di_init[[i]]$lambda_c,
                    Galapagos_rr_lambda_c_di_init[[i]]$mu,
                    Galapagos_rr_lambda_c_di_init[[i]]$gamma,
                    Galapagos_rr_lambda_c_di_init[[i]]$lambda_a,
                    Galapagos_rr_lambda_c_di_init[[i]]$sd),
    idparsopt = c(1, 2, 4, 5, 6),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "cladogenesis"))
}

#Extract global optima
loglik <- sapply(Galapagos_rr_lambda_c_di, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_rr_lambda_c_di_max_loglik <-
  Galapagos_rr_lambda_c_di[[max_loglik]]

#Calculate BIC
Galapagos_rr_lambda_c_di_BIC <-
  4 * (log(1000) + log(2 * pi)) -
  2 * Galapagos_rr_lambda_c_di[[max_loglik]]$loglik

# Relaxed rate cladogenesis diversity-dependent model ---------------------

Galapagos_rr_lambda_c_dd_init <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_lambda_c_dd_init[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
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
}

Galapagos_rr_lambda_c_dd <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_lambda_c_dd[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_rr_lambda_c_dd_init[[i]]$lambda_c,
                    Galapagos_rr_lambda_c_dd_init[[i]]$mu,
                    Galapagos_rr_lambda_c_dd_init[[i]]$K,
                    Galapagos_rr_lambda_c_dd_init[[i]]$gamma,
                    Galapagos_rr_lambda_c_dd_init[[i]]$lambda_a,
                    Galapagos_rr_lambda_c_dd_init[[i]]$sd),
    idparsopt = c(1, 2, 3, 4, 5, 6),
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "cladogenesis"))
}

#Extract global optima
loglik <- sapply(Galapagos_rr_lambda_c_dd, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_rr_lambda_c_dd <-
  Galapagos_rr_lambda_c_dd[[max_loglik]]

#Calculate BIC
Galapagos_rr_lambda_c_dd_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Galapagos_rr_lambda_c_dd[[max_loglik]]$loglik

# Relaxed rate extinction diversity-independent model ---------------------

Galapagos_rr_mu_di_init <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_mu_di_init[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5],
                    init_param_set[[i]][6]),
    idparsopt = c(1, 2, 4, 5, 6),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "extinction"))
}

Galapagos_rr_mu_di <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_mu_di[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_rr_mu_di_init[[i]]$lambda_c,
                    Galapagos_rr_mu_di_init[[i]]$mu,
                    Galapagos_rr_mu_di_init[[i]]$gamma,
                    Galapagos_rr_mu_di_init[[i]]$lambda_a,
                    Galapagos_rr_mu_di_init[[i]]$sd),
    idparsopt = c(1, 2, 4, 5, 6),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "extinction"))
}

#Extract global optima
loglik <- sapply(Galapagos_rr_mu_di, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_rr_mu_di_max_loglik <-
  Galapagos_rr_mu_di[[max_loglik]]

#Calculate BIC
Galapagos_rr_mu_di_BIC <-
  4 * (log(1000) + log(2 * pi)) - 2 * Galapagos_rr_mu_di[[max_loglik]]$loglik

# Relaxed rate extinction diversity-dependent model -----------------------

Galapagos_rr_mu_dd_init <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_mu_dd_init[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
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
                                           relaxed_par = "extinction"))
}

Galapagos_rr_mu_dd <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_mu_dd[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_rr_mu_dd_init[[i]]$lambda_c,
                    Galapagos_rr_mu_dd_init[[i]]$mu,
                    Galapagos_rr_mu_dd_init[[i]]$K,
                    Galapagos_rr_mu_dd_init[[i]]$gamma,
                    Galapagos_rr_mu_dd_init[[i]]$lambda_a,
                    Galapagos_rr_mu_dd_init[[i]]$sd),
    idparsopt = c(1, 2, 3, 4, 5, 6),
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "extinction"))
}

#Extract global optima
loglik <- sapply(Galapagos_rr_mu_dd, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_rr_mu_dd_max_loglik <-
  Galapagos_rr_mu_dd[[max_loglik]]

#Calculate BIC
Galapagos_rr_mu_dd_BIC <-
  5 * (log(1000) + log(2 * pi)) - 2 * Galapagos_rr_mu_dd[[max_loglik]]$loglik

# Relaxed rate carrying capacity model ------------------------------------

Galapagos_rr_k_init <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_k_init[[i]] <- DAISIE_ML_CS(
    datalist = Comoros,
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
                                           relaxed_par = "carrying_capacity"))
}

Galapagos_rr_k <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_k[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_rr_k_init[[i]]$lambda_c,
                    Galapagos_rr_k_init[[i]]$mu,
                    Galapagos_rr_k_init[[i]]$K,
                    Galapagos_rr_k_init[[i]]$gamma,
                    Galapagos_rr_k_init[[i]]$lambda_a,
                    Galapagos_rr_k_init[[i]]$sd),
    idparsopt = c(1, 2, 3, 4, 5, 6),
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "carrying_capacity"))
}

#Extract global optima
loglik <- sapply(Galapagos_rr_k, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_rr_k_max_loglik <-
  Galapagos_rr_k[[max_loglik]]

#Calculate BIC
Galapagos_rr_k_BIC <-
  5 * (log(1000) + log(2 * pi)) - 2 * Galapagos_rr_k[[max_loglik]]$loglik

# Relaxed rate anagenesis diversity-independent model ---------------------

Galapagos_rr_lambda_a_di_init <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_lambda_a_di_init[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5],
                    init_param_set[[i]][6]),
    idparsopt = c(1, 2, 4, 5, 6),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "anagenesis"))
}

Galapagos_rr_lambda_a_di <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_lambda_a_di[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_rr_lambda_a_di_init[[i]]$lambda_c,
                    Galapagos_rr_lambda_a_di_init[[i]]$mu,
                    Galapagos_rr_lambda_a_di_init[[i]]$gamma,
                    Galapagos_rr_lambda_a_di_init[[i]]$lambda_a,
                    Galapagos_rr_lambda_a_di_init[[i]]$sd),
    idparsopt = c(1, 2, 4, 5, 6),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "anagenesis"))
}

#Extract global optima
loglik <- sapply(Galapagos_rr_lambda_a_di, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_rr_lambda_a_di_max_loglik <-
  Galapagos_rr_lambda_a_di[[max_loglik]]

#Calculate BIC
Galapagos_rr_lambda_a_di_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Galapagos_rr_lambda_a_di[[max_loglik]]$loglik

# Relaxed rate anagenesis diversity-dependent model -----------------------

Galapagos_rr_lambda_a_dd_init <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_lambda_a_dd_init[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
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
                                           relaxed_par = "anagenesis"))
}

Galapagos_rr_lambda_a_dd <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_rr_lambda_a_dd[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos,
    initparsopt = c(Galapagos_rr_lambda_a_dd_init[[i]]$lambda_c,
                    Galapagos_rr_lambda_a_dd_init[[i]]$mu,
                    Galapagos_rr_lambda_a_dd_init[[i]]$K,
                    Galapagos_rr_lambda_a_dd_init[[i]]$gamma,
                    Galapagos_rr_lambda_a_dd_init[[i]]$lambda_a,
                    Galapagos_rr_lambda_a_dd_init[[i]]$sd),
    idparsopt = c(1, 2, 3, 4, 5, 6),
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "anagenesis"))
}

#Extract global optima
loglik <- sapply(Galapagos_rr_lambda_a_dd, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Galapagos_rr_lambda_a_dd_max_loglik <-
  Galapagos_rr_lambda_a_dd[[max_loglik]]

#Calculate BIC
Galapagos_rr_lambda_a_dd_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Galapagos_rr_lambda_a_dd[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Galapagos.RData")
Galapagos_results <- list(
  Galapagos_cr_di_max_loglik = Galapagos_cr_di_max_loglik,
  Galapagos_cr_di_BIC = Galapagos_cr_di_BIC,
  Galapagos_cr_dd_max_loglik = Galapagos_cr_dd_max_loglik,
  Galapagos_cr_dd_BIC = Galapagos_cr_dd_BIC,
  Galapagos_cr_di_no_lambda_a_max_loglik = Galapagos_cr_di_no_lambda_a_max_loglik,
  Galapagos_cr_di_no_lambda_a_BIC = Galapagos_cr_di_no_lambda_a_BIC,
  Galapagos_cr_dd_no_lambda_a_max_loglik = Galapagos_cr_dd_no_lambda_a_max_loglik,
  Galapagos_cr_dd_no_lambda_a_BIC = Galapagos_cr_dd_no_lambda_a_BIC,
  Galapagos_rr_mu_di_max_loglik = Galapagos_rr_mu_di_max_loglik,
  Galapagos_rr_mu_di_BIC = Galapagos_rr_mu_di_BIC,
  Galapagos_rr_mu_dd_max_loglik = Galapagos_rr_mu_dd_max_loglik,
  Galapagos_rr_mu_dd_BIC = Galapagos_rr_mu_dd_BIC,
  Galapagos_rr_k_max_loglik = Galapagos_rr_k_max_loglik,
  Galapagos_rr_k_BIC = Galapagos_rr_k_BIC,
  Galapagos_rr_lambda_a_di_max_loglik = Galapagos_rr_lambda_a_di_max_loglik,
  Galapagos_rr_lambda_a_di_BIC = Galapagos_rr_lambda_a_di_BIC,
  Galapagos_rr_lambda_a_dd_max_loglik = Galapagos_rr_lambda_a_dd_max_loglik,
  Galapagos_rr_lambda_a_dd_BIC = Galapagos_rr_lambda_a_dd_BIC)

save(Galapagos_results,
     file = results_file_path)
