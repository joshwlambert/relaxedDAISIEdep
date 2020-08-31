### Chatham models ###
# sample size, should be the same as M

library(DAISIE)

data(Chatham)

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

Chatham_cr_di_init <- list()

for (i in seq_along(init_param_set)) {
  Chatham_cr_di_init[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
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

Chatham_cr_di <- list()

for (i in seq_along(init_param_set)) {
  Chatham_cr_di[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
    initparsopt = c(Chatham_cr_di_init[[i]]$lambda_c,
                    Chatham_cr_di_init[[i]]$mu,
                    Chatham_cr_di_init[[i]]$gamma,
                    Chatham_cr_di_init[[i]]$lambda_a),
    idparsopt = c(1, 2, 4, 5),
    parsfix = Inf,
    idparsfix = 3,
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Chatham_cr_di, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Chatham_cr_di_max_loglik <- Chatham_cr_di[[max_loglik]]

#Calculate BIC
Chatham_cr_di_BIC <-
  4 * (log(1000) + log(2 * pi)) - 2 * Chatham_cr_di[[max_loglik]]$loglik

# Constant rate diversity-dependent model ---------------------------------

Chatham_cr_dd_init <- list()

for (i in seq_along(init_param_set)) {
  Chatham_cr_dd_init[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
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

Chatham_cr_dd <- list()

for (i in seq_along(init_param_set)) {
  Chatham_cr_dd[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
    initparsopt = c(Chatham_cr_dd_init[[i]]$lambda_c,
                    Chatham_cr_dd_init[[i]]$mu,
                    Chatham_cr_dd_init[[i]]$K,
                    Chatham_cr_dd_init[[i]]$gamma,
                    Chatham_cr_dd_init[[i]]$lambda_a),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Chatham_cr_dd, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Chatham_cr_dd_max_loglik <- Chatham_cr_dd[[max_loglik]]

#Calculate BIC
Chatham_cr_dd_BIC <-
  5 * (log(1000) + log(2 * pi)) - 2 * Chatham_cr_dd[[max_loglik]]$loglik

# Constant rate diversity-independent no cladogenesis model ---------------

Chatham_cr_di_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Chatham_cr_di_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
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

Chatham_cr_di_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Chatham_cr_di_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
    initparsopt = c(Chatham_cr_di_no_lambda_c_init[[i]]$mu,
                    Chatham_cr_di_no_lambda_c_init[[i]]$gamma,
                    Chatham_cr_di_no_lambda_c_init[[i]]$lambda_a),
    idparsopt = c(2, 4, 5),
    parsfix = c(0, Inf),
    idparsfix = c(1, 3),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Chatham_cr_di_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Chatham_cr_di_no_lambda_c_max_loglik <- Chatham_cr_di_no_lambda_c[[max_loglik]]

#Calculate BIC
Chatham_cr_di_no_lambda_c_BIC <-
  3 * (log(1000) + log(2 * pi)) -
  2 * Chatham_cr_di_no_lambda_c[[max_loglik]]$loglik

# Constant rate diversity-dependent no cladogenesis model -----------------

Chatham_cr_dd_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Chatham_cr_dd_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
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

Chatham_cr_dd_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Chatham_cr_dd_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
    initparsopt = c(Chatham_cr_dd_no_lambda_c_init[[i]]$mu,
                    Chatham_cr_dd_no_lambda_c_init[[i]]$K,
                    Chatham_cr_dd_no_lambda_c_init[[i]]$gamma,
                    Chatham_cr_dd_no_lambda_c_init[[i]]$lambda_a),
    idparsopt = c(2, 3, 4, 5),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = 1)
}

#Extract global optima
loglik <- sapply(Chatham_cr_dd_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Chatham_cr_dd_no_lambda_c_max_loglik <- Chatham_cr_dd_no_lambda_c[[max_loglik]]

#Calculate BIC
Chatham_cr_dd_no_lambda_c_BIC <-
  4 * (log(1000) + log(2 * pi)) -
  2 * Chatham_cr_dd_no_lambda_c[[max_loglik]]$loglik

# Relaxed rate extinction diversity-independent no cladogenesis mo --------

Chatham_rr_mu_di_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Chatham_rr_mu_di_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
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

Chatham_rr_mu_di_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Chatham_rr_mu_di_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
    initparsopt = c(Chatham_rr_mu_di_no_lambda_c_init[[i]]$mu,
                    Chatham_rr_mu_di_no_lambda_c_init[[i]]$gamma,
                    Chatham_rr_mu_di_no_lambda_c_init[[i]]$lambda_a,
                    Chatham_rr_mu_di_no_lambda_c_init[[i]]$sd),
    idparsopt = c(2, 4, 5, 6),
    parsfix = c(0, Inf),
    idparsfix = c(1, 3),
    ddmodel = 0,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "extinction"))
}

#Extract global optima
loglik <- sapply(Chatham_rr_mu_di_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Chatham_rr_mu_di_no_lambda_c_max_loglik <-
  Chatham_rr_mu_di_no_lambda_c[[max_loglik]]

#Calculate BIC
Chatham_rr_mu_di_no_lambda_c_BIC <-
  4 * (log(1000) + log(2 * pi)) -
  2 * Chatham_rr_mu_di_no_lambda_c[[max_loglik]]$loglik

# Relaxed rate extinction diversity-dependent no cladogenesis model -------

Chatham_rr_mu_dd_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Chatham_rr_mu_dd_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
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

Chatham_rr_mu_dd_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Chatham_rr_mu_dd_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
    initparsopt = c(Chatham_rr_mu_dd_no_lambda_c_init[[i]]$mu,
                    Chatham_rr_mu_dd_no_lambda_c_init[[i]]$K,
                    Chatham_rr_mu_dd_no_lambda_c_init[[i]]$gamma,
                    Chatham_rr_mu_dd_no_lambda_c_init[[i]]$lambda_a,
                    Chatham_rr_mu_dd_no_lambda_c_init[[i]]$sd),
    idparsopt = c(2, 3, 4, 5, 6),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "extinction"))
}

#Extract global optima
loglik <- sapply(Chatham_rr_mu_dd_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Chatham_rr_mu_dd_no_lambda_c_max_loglik <-
  Chatham_rr_mu_dd_no_lambda_c[[max_loglik]]

#Calculate BIC
Chatham_rr_mu_dd_no_lambda_c_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Chatham_rr_mu_dd_no_lambda_c[[max_loglik]]$loglik

# Relaxed rate carrying capacity no cladogenesis model --------------------

Chatham_rr_k_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Chatham_rr_k_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
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

Chatham_rr_k_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Chatham_rr_k_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
    initparsopt = c(Chatham_rr_mu_dd_no_lambda_c_init[[i]]$mu,
                    Chatham_rr_mu_dd_no_lambda_c_init[[i]]$K,
                    Chatham_rr_mu_dd_no_lambda_c_init[[i]]$gamma,
                    Chatham_rr_mu_dd_no_lambda_c_init[[i]]$lambda_a,
                    Chatham_rr_mu_dd_no_lambda_c_init[[i]]$sd),
    idparsopt = c(2, 3, 4, 5, 6),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "carrying_capacity"))
}

#Extract global optima
loglik <- sapply(Chatham_rr_k_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Chatham_rr_k_no_lambda_c_max_loglik <- Chatham_rr_k_no_lambda_c[[max_loglik]]

#Calculate BIC
Chatham_rr_k_no_lambda_c_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Chatham_rr_k_no_lambda_c[[max_loglik]]$loglik

# Relaxed rate anagenesis diversity-independent no cladogenesis mo --------

Chatham_rr_lambda_a_di_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Chatham_rr_lambda_a_di_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
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

Chatham_rr_lambda_a_di_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Chatham_rr_lambda_a_di_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
    initparsopt = c(Chatham_rr_lambda_a_di_no_lambda_c_init[[i]]$mu,
                    Chatham_rr_lambda_a_di_no_lambda_c_init[[i]]$K,
                    Chatham_rr_lambda_a_di_no_lambda_c_init[[i]]$gamma,
                    Chatham_rr_lambda_a_di_no_lambda_c_init[[i]]$lambda_a,
                    Chatham_rr_lambda_a_di_no_lambda_c_init[[i]]$sd),
    idparsopt = c(2, 3, 4, 5, 6),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "anagenesis"))
}

#Extract global optima
loglik <- sapply(Chatham_rr_lambda_a_di_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Chatham_rr_lambda_a_di_no_lambda_c_max_loglik <-
  Chatham_rr_lambda_a_di_no_lambda_c[[max_loglik]]

#Calculate BIC
Chatham_rr_lambda_a_di_no_lambda_c_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Chatham_rr_lambda_a_di_no_lambda_c[[max_loglik]]$loglik

# Relaxed rate anagenesis diversity-dependent no cladogenesis model -------

Chatham_rr_lambda_a_dd_no_lambda_c_init <- list()

for (i in seq_along(init_param_set)) {
  Chatham_rr_lambda_a_dd_no_lambda_c_init[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
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

Chatham_rr_lambda_a_dd_no_lambda_c <- list()

for (i in seq_along(init_param_set)) {
  Chatham_rr_lambda_a_dd_no_lambda_c[[i]] <- DAISIE_ML_CS(
    datalist = Chatham,
    initparsopt = c(Chatham_rr_lambda_a_dd_no_lambda_c_init[[i]]$mu,
                    Chatham_rr_lambda_a_dd_no_lambda_c_init[[i]]$K,
                    Chatham_rr_lambda_a_dd_no_lambda_c_init[[i]]$gamma,
                    Chatham_rr_lambda_a_dd_no_lambda_c_init[[i]]$lambda_a,
                    Chatham_rr_lambda_a_dd_no_lambda_c_init[[i]]$sd),
    idparsopt = c(2, 3, 4, 5, 6),
    parsfix = 0,
    idparsfix = 1,
    ddmodel = 11,
    optimmethod = "simplex",
    CS_version = DAISIE::create_CS_version(model = 2,
                                           relaxed_par = "anagenesis"))
}

#Extract global optima
loglik <- sapply(Chatham_rr_lambda_a_dd_no_lambda_c, '[[', 6)
max_loglik <- which(max(loglik) == loglik)
Chatham_rr_lambda_a_dd_no_lambda_c_max_loglik <-
  Chatham_rr_lambda_a_dd_no_lambda_c[[max_loglik]]

#Calculate BIC
Chatham_rr_lambda_a_dd_no_lambda_c_BIC <-
  5 * (log(1000) + log(2 * pi)) -
  2 * Chatham_rr_lambda_a_dd_no_lambda_c[[max_loglik]]$loglik

#Save results
results_file_path <- file.path(getwd(), "results", "Chatham.RData")
Chatham_results <- list(
  Chatham_cr_di_max_loglik = Chatham_cr_di_max_loglik,
  Chatham_cr_di_BIC = Chatham_cr_di_BIC,
  Chatham_cr_dd_max_loglik = Chatham_cr_dd_max_loglik,
  Chatham_cr_dd_BIC = Chatham_cr_dd_BIC,
  Chatham_cr_di_no_lambda_c_max_loglik = Chatham_cr_di_no_lambda_c_max_loglik,
  Chatham_cr_di_BIC = Chatham_cr_di_BIC,
  Chatham_cr_dd_no_lambda_c_max_loglik = Chatham_cr_dd_no_lambda_c_max_loglik,
  Chatham_cr_dd_no_lambda_c_BIC = Chatham_cr_dd_no_lambda_c_BIC,
  Chatham_rr_mu_di_no_lambda_c_max_loglik = Chatham_rr_mu_di_no_lambda_c_max_loglik,
  Chatham_rr_mu_di_no_lambda_c_BIC = Chatham_rr_mu_di_no_lambda_c_BIC,
  Chatham_rr_mu_dd_no_lambda_c_max_loglik = Chatham_rr_mu_dd_no_lambda_c_max_loglik,
  Chatham_rr_mu_dd_no_lambda_c_BIC = Chatham_rr_mu_dd_no_lambda_c_BIC,
  Chatham_rr_k_no_lambda_c_max_loglik = Chatham_rr_k_no_lambda_c_max_loglik,
  Chatham_rr_k_no_lambda_c_BIC = Chatham_rr_k_no_lambda_c_BIC,
  Chatham_rr_lambda_a_di_no_lambda_c_max_loglik = Chatham_rr_lambda_a_di_no_lambda_c_max_loglik,
  Chatham_rr_lambda_a_di_no_lambda_c_BIC = Chatham_rr_lambda_a_di_no_lambda_c_BIC,
  Chatham_rr_lambda_a_dd_no_lambda_c_max_loglik = Chatham_rr_lambda_a_dd_no_lambda_c_max_loglik,
  Chatham_rr_lambda_a_dd_no_lambda_c_BIC = Chatham_rr_lambda_a_dd_no_lambda_c_BIC)

save(Chatham_results,
     file = results_file_path)
