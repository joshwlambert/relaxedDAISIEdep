### Aldabra_Group models ###
# sample size, should be the same as M

library(DAISIE)

data(Aldabra_Group)

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

# Constant rate diversity-independent model
Aldabra_Group_cr_di_param_1 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(init_param_set[[1]][1],
                  init_param_set[[1]][2],
                  init_param_set[[1]][4],
                  init_param_set[[1]][5]),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_2 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(init_param_set[[2]][1],
                  init_param_set[[2]][2],
                  init_param_set[[2]][4],
                  init_param_set[[2]][5]),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_3 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(init_param_set[[3]][1],
                  init_param_set[[3]][2],
                  init_param_set[[3]][4],
                  init_param_set[[3]][5]),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_4 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(init_param_set[[4]][1],
                  init_param_set[[4]][2],
                  init_param_set[[4]][4],
                  init_param_set[[4]][5]),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_5 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(init_param_set[[5]][1],
                  init_param_set[[5]][2],
                  init_param_set[[5]][4],
                  init_param_set[[5]][5]),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_6 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(init_param_set[[6]][1],
                  init_param_set[[6]][2],
                  init_param_set[[6]][4],
                  init_param_set[[6]][5]),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_7 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(init_param_set[[7]][1],
                  init_param_set[[7]][2],
                  init_param_set[[7]][4],
                  init_param_set[[7]][5]),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_8 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(init_param_set[[8]][1],
                  init_param_set[[8]][2],
                  init_param_set[[8]][4],
                  init_param_set[[8]][5]),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_9 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(init_param_set[[9]][1],
                  init_param_set[[9]][2],
                  init_param_set[[9]][4],
                  init_param_set[[9]][5]),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_10 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(init_param_set[[10]][1],
                  init_param_set[[10]][2],
                  init_param_set[[10]][4],
                  init_param_set[[10]][5]),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_1 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(Aldabra_Group_cr_di_param_1$lambda_c,
                  Aldabra_Group_cr_di_param_1$mu,
                  Aldabra_Group_cr_di_param_1$gamma,
                  Aldabra_Group_cr_di_param_1$lambda_a),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_2 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(Aldabra_Group_cr_di_param_2$lambda_c,
                  Aldabra_Group_cr_di_param_2$mu,
                  Aldabra_Group_cr_di_param_2$gamma,
                  Aldabra_Group_cr_di_param_2$lambda_a),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_3 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(Aldabra_Group_cr_di_param_3$lambda_c,
                  Aldabra_Group_cr_di_param_3$mu,
                  Aldabra_Group_cr_di_param_3$gamma,
                  Aldabra_Group_cr_di_param_3$lambda_a),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_4 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(Aldabra_Group_cr_di_param_4$lambda_c,
                  Aldabra_Group_cr_di_param_4$mu,
                  Aldabra_Group_cr_di_param_4$gamma,
                  Aldabra_Group_cr_di_param_4$lambda_a),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_5 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(Aldabra_Group_cr_di_param_5$lambda_c,
                  Aldabra_Group_cr_di_param_5$mu,
                  Aldabra_Group_cr_di_param_5$gamma,
                  Aldabra_Group_cr_di_param_5$lambda_a),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_6 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(Aldabra_Group_cr_di_param_6$lambda_c,
                  Aldabra_Group_cr_di_param_6$mu,
                  Aldabra_Group_cr_di_param_6$gamma,
                  Aldabra_Group_cr_di_param_6$lambda_a),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_7 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(Aldabra_Group_cr_di_param_7$lambda_c,
                  Aldabra_Group_cr_di_param_7$mu,
                  Aldabra_Group_cr_di_param_7$gamma,
                  Aldabra_Group_cr_di_param_7$lambda_a),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_8 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(Aldabra_Group_cr_di_param_8$lambda_c,
                  Aldabra_Group_cr_di_param_8$mu,
                  Aldabra_Group_cr_di_param_8$gamma,
                  Aldabra_Group_cr_di_param_8$lambda_a),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_9 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(Aldabra_Group_cr_di_param_9$lambda_c,
                  Aldabra_Group_cr_di_param_9$mu,
                  Aldabra_Group_cr_di_param_9$gamma,
                  Aldabra_Group_cr_di_param_9$lambda_a),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di_param_10 <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(Aldabra_Group_cr_di_param_10$lambda_c,
                  Aldabra_Group_cr_di_param_10$mu,
                  Aldabra_Group_cr_di_param_10$gamma,
                  Aldabra_Group_cr_di_param_10$lambda_a),
  idparsopt = c(1, 2, 4, 5),
  parsfix = Inf,
  idparsfix = 3,
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di$BIC <- 4 * log(1000) - 2 * Aldabra_Group_cr_di$loglik

#Constant rate diversity-dependent model
Aldabra_Group_cr_dd <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(1, 1, 100, 0.01, 1),
  idparsopt = 1:5,
  parsfix = NULL,
  idparsfix = NULL,
  ddmodel = 11,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_dd$BIC <- 4 * log(1000) - 2 * Aldabra_Group_cr_dd$loglik

# Constant rate diversity-independent no cladogenesis model
Aldabra_Group_cr_di_no_lambda_c <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(1, 0.01, 1),
  idparsopt = c(2, 4, 5),
  parsfix = c(0, Inf),
  idparsfix = c(1, 3),
  ddmodel = 0,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_di$BIC <- 4 * log(1000) - 2 * Aldabra_Group_cr_di$loglik

#Constant rate diversity-dependent model
Aldabra_Group_cr_dd_no_lambda_c <- DAISIE_ML_CS(
  datalist = Aldabra_Group,
  initparsopt = c(1, 100, 0.01, 1),
  idparsopt = 2:5,
  parsfix = 0,
  idparsfix = 1,
  ddmodel = 11,
  optimmethod = "simplex",
  CS_version = 1)

Aldabra_Group_cr_dd$BIC <- 4 * log(1000) - 2 * Aldabra_Group_cr_dd$loglik
