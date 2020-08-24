library(DAISIE)

data(Galapagos_datalist)

cr <- DAISIE_ML_CS(
  datalist = Galapagos_datalist,
  initparsopt = c(2.5, 2.7, 20, 0.009, 1.01),
  idparsopt = 1:5,
  parsfix = NULL,
  idparsfix = NULL,
  ddmodel = 11,
  optimmethod = "simplex",
  CS_version = 1)

rr_clado_sd_1 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "cladogenesis", sd = 1),
  abstolint = 1e-16,
  reltolint = 1e-10)

rr_clado_sd_001 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "cladogenesis", sd = 0.01),
  abstolint = 1e-16,
  reltolint = 1e-10)

rr_clado_sd_00001 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "cladogenesis", sd = 0.0001),
  abstolint = 1e-16,
  reltolint = 1e-10)

rr_ext_sd_1 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "extinction", sd = 1),
  abstolint = 1e-16,
  reltolint = 1e-10)

rr_ext_sd_001 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "extinction", sd = 0.01),
  abstolint = 1e-16,
  reltolint = 1e-10)

rr_ext_sd_00001 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "extinction", sd = 0.0001),
  abstolint = 1e-16,
  reltolint = 1e-10)

rr_carr_cap_sd_1 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "carrying_capacity", sd = 1),
  abstolint = 1e-16,
  reltolint = 1e-10)

rr_carr_cap_sd_001 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "carrying_capacity", sd = 0.01),
  abstolint = 1e-16,
  reltolint = 1e-10)

rr_carr_cap_sd_00001 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "carrying_capacity", sd = 0.0001),
  abstolint = 1e-16,
  reltolint = 1e-10)

rr_ana_sd_1 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "anagenesis", sd = 1),
  abstolint = 1e-16,
  reltolint = 1e-10)

rr_ana_sd_001 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "anagenesis", sd = 0.01),
  abstolint = 1e-16,
  reltolint = 1e-10)

rr_ana_sd_00001 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "anagenesis", sd = 0.0001),
  abstolint = 1e-16,
  reltolint = 1e-10)


#Cladogenesis lineage

clado_lineage <- calc_rr_approach_cr(parameter = "cladogenesis",
                                     clade = "lineage")

plot(clado_lineage[[1]],
     clado_lineage[[2]],
     ylab = "Delta likelihood",
     xlab = "sd",
     col = "red",
     main = "Cladogenesis lineage")

#Extinction lineage

ext_lineage <- calc_rr_approach_cr(parameter = "extinction",
                                   clade = "lineage")

plot(ext_lineage[[1]],
     ext_lineage[[2]],
     ylab = "Delta likelihood",
     xlab = "sd",
     col = "red",
     main = "Extinction lineage")

#Carrying capacity lineage

k_lineage <- calc_rr_approach_cr(parameter = "carrying_capacity",
                                 clade = "lineage")

plot(k_lineage[[1]],
     k_lineage[[2]],
     ylab = "Delta likelihood",
     xlab = "sd",
     col = "red",
     main = "Carrying capacity lineage")

#Anagenesis lineage

ana_lineage <- calc_rr_approach_cr(parameter = "anagenesis",
                                   clade = "lineage")

plot(ana_lineage[[1]],
     ana_lineage[[2]],
     ylab = "Delta likelihood",
     xlab = "sd",
     col = "red",
     main = "Anagenesis lineage")

#Cladogenesis radiation

clado_radiation <- calc_rr_approach_cr(parameter = "cladogenesis",
                                       clade = "radiation")

plot(clado_radiation[[1]],
     clado_radiation[[2]],
     ylab = "Delta likelihood",
     xlab = "sd",
     col = "red",
     main = "Cladogenesis radiation")

#Extinction radiation

ext_radiation <- calc_rr_approach_cr(parameter = "extinction",
                                     clade = "radiation")

plot(ext_radiation[[1]],
     ext_radiation[[2]],
     ylab = "Delta likelihood",
     xlab = "sd",
     col = "red",
     main = "Extinction radiation")

#Carrying capacity radiation

k_radiation <- calc_rr_approach_cr(parameter = "carrying_capacity",
                                   clade = "radiation")

plot(k_radiation[[1]],
     k_radiation[[2]],
     ylab = "Delta likelihood",
     xlab = "sd",
     col = "red",
     main = "Carrying capacity radiation")

#Anagenesis radiation

ana_radiation <- calc_rr_approach_cr(parameter = "anagenesis",
                                     clade = "radiation")

plot(ana_radiation[[1]],
     ana_radiation[[2]],
     ylab = "Delta likelihood",
     xlab = "sd",
     col = "red",
     main = "Anagenesis radiation")

