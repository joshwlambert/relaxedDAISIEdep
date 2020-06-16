library(DAISIE)
lac <- c(0.25, 0.5)
mu <- c(0.25, 0.5)
K <- 20
gam <- c(0.005, 0.01)
laa <- c(0.5, 1.0)

param_space <- expand.grid(lac, mu, K, gam, laa)

data_set <- list()
for (i in seq_len(nrow(param_space))) {
  data_set[[i]] <- DAISIE_sim_constant_rate(
    time = 5,
    M = 1000,
    pars = as.numeric(param_space[i, ]),
    replicates = 100)
}

subplex_results <- list()
simplex_results <- list()
for (i in seq_len(length(data_set))) {
  for (j in seq_len(length(data_set[[i]])))
    subplex_results[[i]] <- DAISIE_ML_CS(datalist = data_set[[1]][[i]][[j]],
                                         initparsopt = c(0.5, 0.5, 20, 0.005, 0.5),
                                         idparsopt = 1:5,
                                         idparsfix = NULL,
                                         parsfix = NULL,
                                         optimmethod = "subplex")
  simplex_results[[i]] <- DAISIE_ML_CS(datalist = data_set[[1]][[i]][[j]],
                                       initparsopt = c(0.5, 0.5, 20, 0.005, 0.5),
                                       idparsopt = 1:5,
                                       idparsfix = NULL,
                                       parsfix = NULL,
                                       optimmethod = "simplex")
}
