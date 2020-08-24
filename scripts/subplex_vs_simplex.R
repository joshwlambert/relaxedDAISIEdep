library(DAISIE)

data(Galapagos_datalist)

data(Greater_Antilles)

data(New_Zealand)

data(Hispaniola)

init_param_set <- list()
set.seed(1)
for (i in 1:10) {
  init_param_set[[i]] <- runif(2, 0.1, 2)
  init_param_set[[i]][3] <- runif(1, 30, 100)
  init_param_set[[i]][4] <- runif(1, 0.001, 0.01)
  init_param_set[[i]][5] <- runif(1, 0.1, 2)
}

Galapagos_simplex <- list()
Galapagos_subplex <- list()

for (i in seq_along(init_param_set)) {
  Galapagos_simplex[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos_datalist,
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

  Galapagos_subplex[[i]] <- DAISIE_ML_CS(
    datalist = Galapagos_datalist,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][3],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5]),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "subplex",
    CS_version = 1)
}

Galapagos_simplex_loglik <- sapply(Galapagos_simplex, '[[', 6)
Galapagos_subplex_loglik <- sapply(Galapagos_subplex, '[[', 6)
Galapagos_delta_loglik <- abs(Galapagos_simplex_loglik -
                                Galapagos_subplex_loglik)
which(Galapagos_delta_loglik > 1e-3)

Greater_Antilles_simplex <- list()
Greater_Antilles_subplex <- list()

for (i in seq_along(init_param_set)) {
  Greater_Antilles_simplex[[i]] <- DAISIE_ML_CS(
    datalist = Greater_Antilles,
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

  Greater_Antilles_subplex[[i]] <- DAISIE_ML_CS(
    datalist = Greater_Antilles,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][3],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5]),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "subplex",
    CS_version = 1)
}

Greater_Antilles_simplex_loglik <- sapply(Greater_Antilles_simplex, '[[', 6)
Greater_Antilles_subplex_loglik <- sapply(Greater_Antilles_subplex, '[[', 6)
Greater_Antilles_delta_loglik <- abs(Greater_Antilles_simplex_loglik -
                                       Greater_Antilles_subplex_loglik)
which(Greater_Antilles_delta_loglik > 1e-3)

New_Zealand_simplex <- list()
New_Zealand_subplex <- list()

for (i in seq_along(init_param_set)) {
  New_Zealand_simplex[[i]] <- DAISIE_ML_CS(
    datalist = New_Zealand,
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

  New_Zealand_subplex[[i]] <- DAISIE_ML_CS(
    datalist = New_Zealand,
    initparsopt = c(init_param_set[[i]][1],
                    init_param_set[[i]][2],
                    init_param_set[[i]][3],
                    init_param_set[[i]][4],
                    init_param_set[[i]][5]),
    idparsopt = 1:5,
    parsfix = NULL,
    idparsfix = NULL,
    ddmodel = 11,
    optimmethod = "subplex",
    CS_version = 1)
}

New_Zealand_simplex_loglik <- sapply(New_Zealand_simplex, '[[', 6)
New_Zealand_subplex_loglik <- sapply(New_Zealand_subplex, '[[', 6)
New_Zealand_delta_loglik <- abs(New_Zealand_simplex_loglik -
                                       New_Zealand_subplex_loglik)
which(New_Zealand_delta_loglik > 1e-3)

Hispaniola_simplex <- list()
Hispaniola_subplex <- list()

for (i in seq_along(init_param_set)) {
  Hispaniola_simplex[[i]] <- DAISIE_ML_CS(
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

  Hispaniola_subplex[[i]] <- DAISIE_ML_CS(
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
    optimmethod = "subplex",
    CS_version = 1)
}

Hispaniola_simplex_loglik <- sapply(Hispaniola_simplex, '[[', 6)
Hispaniola_subplex_loglik <- sapply(Hispaniola_subplex, '[[', 6)
Hispaniola_delta_loglik <- abs(Hispaniola_simplex_loglik -
                                 Hispaniola_subplex_loglik)
which(Hispaniola_delta_loglik > 1e-3)
