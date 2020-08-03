library(DAISIE)

data(Galapagos_datalist)

init_param_set <- list()
set.seed(1)

init_param_set[[1]] <- runif(2, 0.1, 2)
init_param_set[[1]][3] <- runif(1, 15, 100)
init_param_set[[1]][4] <- runif(1, 0.001, 0.1)
init_param_set[[1]][5] <- runif(1, 0.1, 2)
init_param_set[[2]] <- runif(2, 0.1, 2)
init_param_set[[2]][3] <- runif(1, 15, 100)
init_param_set[[2]][4] <- runif(1, 0.001, 0.1)
init_param_set[[2]][5] <- runif(1, 0.1, 2)
init_param_set[[3]] <- runif(2, 0.1, 2)
init_param_set[[3]][3] <- runif(1, 15, 100)
init_param_set[[3]][4] <- runif(1, 0.001, 0.1)
init_param_set[[3]][5] <- runif(1, 0.1, 2)
init_param_set[[4]] <- runif(2, 0.1, 2)
init_param_set[[4]][3] <- runif(1, 15, 100)
init_param_set[[4]][4] <- runif(1, 0.001, 0.1)
init_param_set[[4]][5] <- runif(1, 0.1, 2)
init_param_set[[5]] <- runif(2, 0.1, 2)
init_param_set[[5]][3] <- runif(1, 15, 100)
init_param_set[[5]][4] <- runif(1, 0.001, 0.1)
init_param_set[[5]][5] <- runif(1, 0.1, 2)
init_param_set[[6]] <- runif(2, 0.1, 2)
init_param_set[[6]][3] <- runif(1, 15, 100)
init_param_set[[6]][4] <- runif(1, 0.001, 0.1)
init_param_set[[6]][5] <- runif(1, 0.1, 2)
init_param_set[[7]] <- runif(2, 0.1, 2)
init_param_set[[7]][3] <- runif(1, 15, 100)
init_param_set[[7]][4] <- runif(1, 0.001, 0.1)
init_param_set[[7]][5] <- runif(1, 0.1, 2)
init_param_set[[8]] <- runif(2, 0.1, 2)
init_param_set[[8]][3] <- runif(1, 15, 100)
init_param_set[[8]][4] <- runif(1, 0.001, 0.1)
init_param_set[[8]][5] <- runif(1, 0.1, 2)
init_param_set[[9]] <- runif(2, 0.1, 2)
init_param_set[[9]][3] <- runif(1, 15, 100)
init_param_set[[9]][4] <- runif(1, 0.001, 0.1)
init_param_set[[9]][5] <- runif(1, 0.1, 2)
init_param_set[[10]] <- runif(2, 0.1, 2)
init_param_set[[10]][3] <- runif(1, 15, 100)
init_param_set[[10]][4] <- runif(1, 0.001, 0.1)
init_param_set[[10]][5] <- runif(1, 0.1, 2)

subplex_results <- list()
simplex_results <- list()

for (i in seq_along(init_param_set)) {
  subplex_results[[i]] <- DAISIE_ML_CS(datalist = Galapagos_datalist,
                                       initparsopt = init_param_set[[i]],
                                       idparsopt = 1:5,
                                       idparsfix = NULL,
                                       parsfix = NULL,
                                       ddmodel = 11,
                                       optimmethod = "subplex")
  simplex_results[[i]] <- DAISIE_ML_CS(datalist = Galapagos_datalist,
                                       initparsopt = init_param_set[[i]],
                                       idparsopt = 1:5,
                                       idparsfix = NULL,
                                       parsfix = NULL,
                                       ddmodel = 11,
                                       optimmethod = "simplex")
}

#ANOVA or other technique analysing the clustering of variance

vec <- c()
for (i in 1:length(subplex_loglik)) {
  vec[i] <- subplex_loglik[i] - mean(subplex_loglik)
}

1 / (10 - 1) * sum(subplex_loglik[i] - mean(subplex_loglik))

apply(subplex_loglik, f(x), function(x){})
