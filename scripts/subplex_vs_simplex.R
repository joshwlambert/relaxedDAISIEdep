library(DAISIE)

#Create ten sets of initial parameter values sampling from uniform distributions

init_param_set <- list()
set.seed(1)
init_param_set[[1]] <- runif(2, 0.1, 2)
init_param_set[[1]][3] <- runif(1, 30, 100)
init_param_set[[1]][4] <- runif(1, 0.001, 0.01)
init_param_set[[1]][5] <- runif(1, 0.1, 2)
init_param_set[[2]] <- runif(2, 0.1, 2)
init_param_set[[2]][3] <- runif(1, 30, 100)
init_param_set[[2]][4] <- runif(1, 0.001, 0.01)
init_param_set[[2]][5] <- runif(1, 0.1, 2)
init_param_set[[3]] <- runif(2, 0.1, 2)
init_param_set[[3]][3] <- runif(1, 30, 100)
init_param_set[[3]][4] <- runif(1, 0.001, 0.01)
init_param_set[[3]][5] <- runif(1, 0.1, 2)
init_param_set[[4]] <- runif(2, 0.1, 2)
init_param_set[[4]][3] <- runif(1, 30, 100)
init_param_set[[4]][4] <- runif(1, 0.001, 0.01)
init_param_set[[4]][5] <- runif(1, 0.1, 2)
init_param_set[[5]] <- runif(2, 0.1, 2)
init_param_set[[5]][3] <- runif(1, 30, 100)
init_param_set[[5]][4] <- runif(1, 0.001, 0.01)
init_param_set[[5]][5] <- runif(1, 0.1, 2)
init_param_set[[6]] <- runif(2, 0.1, 2)
init_param_set[[6]][3] <- runif(1, 30, 100)
init_param_set[[6]][4] <- runif(1, 0.001, 0.01)
init_param_set[[6]][5] <- runif(1, 0.1, 2)
init_param_set[[7]] <- runif(2, 0.1, 2)
init_param_set[[7]][3] <- runif(1, 30, 100)
init_param_set[[7]][4] <- runif(1, 0.001, 0.01)
init_param_set[[7]][5] <- runif(1, 0.1, 2)
init_param_set[[8]] <- runif(2, 0.1, 2)
init_param_set[[8]][3] <- runif(1, 30, 100)
init_param_set[[8]][4] <- runif(1, 0.001, 0.01)
init_param_set[[8]][5] <- runif(1, 0.1, 2)
init_param_set[[9]] <- runif(2, 0.1, 2)
init_param_set[[9]][3] <- runif(1, 30, 100)
init_param_set[[9]][4] <- runif(1, 0.001, 0.01)
init_param_set[[9]][5] <- runif(1, 0.1, 2)
init_param_set[[10]] <- runif(2, 0.1, 2)
init_param_set[[10]][3] <- runif(1, 30, 100)
init_param_set[[10]][4] <- runif(1, 0.001, 0.01)
init_param_set[[10]][5] <- runif(1, 0.1, 2)

# #Load data
# data(frogs_datalist)
#
# subplex_frogs <- list()
# simplex_frogs <- list()
#
# for (i in seq_along(init_param_set)) {
#   subplex_frogs[[i]] <- DAISIE_ML_CS(
#     datalist = frogs_datalist,
#     initparsopt = init_param_set[[i]],
#     idparsopt = 1:5,
#     idparsfix = NULL,
#     parsfix = NULL,
#     ddmodel = 11,
#     optimmethod = "subplex")
#
#   simplex_frogs[[i]] <- DAISIE_ML_CS(
#     datalist = frogs_datalist,
#     initparsopt = init_param_set[[i]],
#     idparsopt = 1:5,
#     idparsfix = NULL,
#     parsfix = NULL,
#     ddmodel = 11,
#     optimmethod = "simplex")
# }
#
# lambda_c_diff_frogs <- c()
# mu_diff_frogs <- c()
# K_diff_frogs <- c()
# gamma_diff_frogs <- c()
# lambda_a_diff_frogs <- c()
# loglik_diff_frogs <- c()
#
# for (i in seq_along(subplex_frogs)) {
#   lambda_c_diff_frogs[i] <-
#     abs(subplex_frogs[[i]]$lambda_c - simplex_frogs[[i]]$lambda_c)
#   mu_diff_frogs[i] <- abs(subplex_frogs[[i]]$mu - simplex_frogs[[i]]$mu)
#   K_diff_frogs[i] <- abs(subplex_frogs[[i]]$K - simplex_frogs[[i]]$K)
#   gamma_diff_frogs[i] <-
#     abs(subplex_frogs[[i]]$gamma - simplex_frogs[[i]]$gamma)
#   lambda_a_diff_frogs[i] <-
#     abs(subplex_frogs[[i]]$lambda_a - simplex_frogs[[i]]$lambda_a)
#   loglik_diff_frogs[i] <-
#     abs(subplex_frogs[[i]]$loglik - simplex_frogs[[i]]$loglik)
# }
#
# z_lambda_c_frogs <- (1 / length(subplex_frogs)) * sum(lambda_c_diff_frogs)
# z_mu_frogs <- (1 / length(subplex_frogs)) * sum(mu_diff_frogs)
# z_K_frogs <- (1 / length(subplex_frogs)) * sum(K_diff_frogs)
# z_gamma_frogs <- (1 / length(subplex_frogs)) * sum(gamma_diff_frogs)
# z_lambda_a_frogs <- (1 / length(subplex_frogs)) * sum(lambda_a_diff_frogs)
# z_loglik_frogs <- (1 / length(subplex_frogs)) * sum(loglik_diff_frogs)

#Load data
data(Bats_GreaterAntilles)

subplex_bats <- list()
simplex_bats <- list()

for (i in seq_along(init_param_set)) {
  subplex_bats[[i]] <- DAISIE_ML_CS(
    datalist = Bats_GreaterAntilles,
    initparsopt = init_param_set[[i]],
    idparsopt = 1:5,
    idparsfix = NULL,
    parsfix = NULL,
    ddmodel = 11,
    optimmethod = "subplex")

  simplex_bats[[i]] <- DAISIE_ML_CS(
    datalist = Bats_GreaterAntilles,
    initparsopt = init_param_set[[i]],
    idparsopt = 1:5,
    idparsfix = NULL,
    parsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex")
}

lambda_c_diff_bats <- c()
mu_diff_bats <- c()
K_diff_bats <- c()
gamma_diff_bats <- c()
lambda_a_diff_bats <- c()
loglik_diff_bats <- c()

for (i in seq_along(subplex_bats)) {
  lambda_c_diff_bats[i] <-
    abs(subplex_bats[[i]]$lambda_c - simplex_bats[[i]]$lambda_c)
  mu_diff_bats[i] <- abs(subplex_bats[[i]]$mu - simplex_bats[[i]]$mu)
  K_diff_bats[i] <- abs(subplex_bats[[i]]$K - simplex_bats[[i]]$K)
  gamma_diff_bats[i] <- abs(subplex_bats[[i]]$gamma - simplex_bats[[i]]$gamma)
  lambda_a_diff_bats[i] <-
    abs(subplex_bats[[i]]$lambda_a - simplex_bats[[i]]$lambda_a)
  loglik_diff_bats[i] <-
    abs(subplex_bats[[i]]$loglik - simplex_bats[[i]]$loglik)
}

z_lambda_c_bats <- (1 / length(subplex_bats)) * sum(lambda_c_diff_bats)
z_mu_bats <- (1 / length(subplex_bats)) * sum(mu_diff_bats)
z_K_bats <- (1 / length(subplex_bats)) * sum(K_diff_bats)
z_gamma_bats <- (1 / length(subplex_bats)) * sum(gamma_diff_bats)
z_lambda_a_bats <- (1 / length(subplex_bats)) * sum(lambda_a_diff_bats)
z_loglik_bats <- (1 / length(subplex_bats)) * sum(loglik_diff_bats)

#Load data
data(NewZealand_birds_datalist)

subplex_birds <- list()
simplex_birds <- list()

for (i in seq_along(init_param_set)) {
  subplex_birds[[i]] <- DAISIE_ML_CS(
    datalist = NewZealand_birds_datalist,
    initparsopt = init_param_set[[i]],
    idparsopt = 1:5,
    idparsfix = NULL,
    parsfix = NULL,
    ddmodel = 11,
    optimmethod = "subplex")

  simplex_birds[[i]] <- DAISIE_ML_CS(
    datalist = NewZealand_birds_datalist,
    initparsopt = init_param_set[[i]],
    idparsopt = 1:5,
    idparsfix = NULL,
    parsfix = NULL,
    ddmodel = 11,
    optimmethod = "simplex")
}

for (i in seq_along(subplex_birds)) {
  lambda_c_diff_birds[i] <-
    abs(subplex_birds[[i]]$lambda_c - simplex_birds[[i]]$lambda_c)
  mu_diff_birds[i] <- abs(subplex_birds[[i]]$mu - simplex_birds[[i]]$mu)
  K_diff_birds[i] <- abs(subplex_birds[[i]]$K - simplex_birds[[i]]$K)
  gamma_diff_birds[i] <-
    abs(subplex_birds[[i]]$gamma - simplex_birds[[i]]$gamma)
  lambda_a_diff_birds[i] <-
    abs(subplex_birds[[i]]$lambda_a - simplex_birds[[i]]$lambda_a)
  loglik_diff_birds[i] <-
    abs(subplex_birds[[i]]$loglik - simplex_birds[[i]]$loglik)
}

z_lambda_c_birds <- (1 / length(subplex_birds)) * sum(lambda_c_diff)
z_mu_birds <- (1 / length(subplex_birds)) * sum(mu_diff)
z_K_birds <- (1 / length(subplex_birds)) * sum(K_diff)
z_gamma_birds <- (1 / length(subplex_birds)) * sum(gamma_diff)
z_lambda_a_birds <- (1 / length(subplex_birds)) * sum(lambda_a_diff)
z_loglik_birds <- (1 / length(subplex_birds)) * sum(loglik_diff)
