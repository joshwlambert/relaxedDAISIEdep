library(DAISIE)

data(Galapagos_datalist)

cr <- DAISIE_ML_CS(
  datalist = Galapagos_datalist,
  initparsopt = c(2.5, 2.7, 20, 0.009, 1.01),
  idparsopt = 1:5,
  parsfix = NULL,
  idparsfix = NULL,
  ddmodel = 11,
  cond = 0,
  optimmethod = "simplex",
  CS_version = 1)

rr_clado_sd_5 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "cladogenesis", sd = 5),
  abstolint = 1e-16,
  reltolint = 1e-10)

abs(cr$loglik - rr_clado_sd_5)

rr_clado_sd_1 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "cladogenesis", sd = 1),
  abstolint = 1e-16,
  reltolint = 1e-10)

abs(cr$loglik - rr_clado_sd_1)

rr_clado_sd_01 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "cladogenesis", sd = 0.1),
  abstolint = 1e-16,
  reltolint = 1e-10)

abs(cr$loglik - rr_clado_sd_01)

rr_clado_sd_005 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "cladogenesis", sd = 0.05),
  abstolint = 1e-16,
  reltolint = 1e-10)

abs(cr$loglik - rr_clado_sd_005)

rr_ext_sd_5 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "extinction", sd = 5),
  abstolint = 1e-16,
  reltolint = 1e-10)

abs(cr$loglik - rr_ext_sd_5)

rr_ext_sd_1 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "extinction", sd = 1),
  abstolint = 1e-16,
  reltolint = 1e-10)

abs(cr$loglik - rr_ext_sd_1)

rr_ext_sd_01 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "extinction", sd = 0.1),
  abstolint = 1e-16,
  reltolint = 1e-10)

abs(cr$loglik - rr_ext_sd_01)

rr_ext_sd_005 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "extinction", sd = 0.05),
  abstolint = 1e-16,
  reltolint = 1e-10)

abs(cr$loglik - rr_ext_sd_005)

rr_ana_sd_5 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "anagenesis", sd = 5),
  abstolint = 1e-16,
  reltolint = 1e-10)

abs(cr$loglik - rr_ana_sd_5)

rr_ana_sd_1 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "anagenesis", sd = 1),
  abstolint = 1e-16,
  reltolint = 1e-10)

abs(cr$loglik - rr_ana_sd_1)

rr_ana_sd_01 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "anagenesis", sd = 0.1),
  abstolint = 1e-16,
  reltolint = 1e-10)

abs(cr$loglik - rr_ana_sd_01)

rr_ana_sd_005 <- DAISIE_loglik_CS(
  pars1 = c(cr$lambda_c, cr$mu, cr$K, cr$gamma, cr$lambda_a),
  pars2 = c(100, 11, 0, 0, NA),
  datalist = Galapagos_datalist,
  methode = "lsodes",
  CS_version = list(model = 2, relaxed_par = "anagenesis", sd = 0.05),
  abstolint = 1e-16,
  reltolint = 1e-10)

abs(cr$loglik - rr_ana_sd_005)

#Cladogenesis lineage

clado_lineage <- calc_rr_approach_cr(parameter = "cladogenesis",
                                     clade = "lineage")

plot(clado_lineage[[1]],
     clado_lineage[[2]],
     ylab = "Delta likelihood",
     xlab = "Standard deviation",
     main = "Relaxed Cladogenesis (lineage)")

#Extinction lineage

ext_lineage <- calc_rr_approach_cr(parameter = "extinction",
                                   clade = "lineage")

plot(ext_lineage[[1]],
     ext_lineage[[2]],
     ylab = "Delta likelihood",
     xlab = "Standard deviation",
     main = "Relaxed Extinction (lineage)")

#Carrying capacity lineage

k_lineage <- calc_rr_approach_cr(parameter = "carrying_capacity",
                                 clade = "lineage")

plot(k_lineage[[1]],
     k_lineage[[2]],
     ylab = "Delta likelihood",
     xlab = "Standard deviation",
     main = "Relaxed Carrying capacity (lineage)")

#Anagenesis lineage

ana_lineage <- calc_rr_approach_cr(parameter = "anagenesis",
                                   clade = "lineage")

plot(ana_lineage[[1]],
     ana_lineage[[2]],
     ylab = "Delta likelihood",
     xlab = "Standard deviation",
     main = "Relaxed Anagenesis (lineage)")

#Cladogenesis radiation

clado_radiation <- calc_rr_approach_cr(parameter = "cladogenesis",
                                       clade = "radiation")

plot(clado_radiation[[1]],
     clado_radiation[[2]],
     ylab = "Delta likelihood",
     xlab = "Standard deviation",
     main = "Relaxed Cladogenesis (radiation)")

#Extinction radiation

ext_radiation <- calc_rr_approach_cr(parameter = "extinction",
                                     clade = "radiation")

plot(ext_radiation[[1]],
     ext_radiation[[2]],
     ylab = "Delta likelihood",
     xlab = "Standard deviation",
     main = "Relaxed Extinction (radiation)")

#Carrying capacity radiation

k_radiation <- calc_rr_approach_cr(parameter = "carrying_capacity",
                                   clade = "radiation")

plot(k_radiation[[1]],
     k_radiation[[2]],
     ylab = "Delta likelihood",
     xlab = "Standard deviation",
     main = "Relaxed Carrying capacity (radiation)")

#Anagenesis radiation

ana_radiation <- calc_rr_approach_cr(parameter = "anagenesis",
                                     clade = "radiation")

plot(ana_radiation[[1]],
     ana_radiation[[2]],
     ylab = "Delta likelihood",
     xlab = "Standard deviation",
     main = "Relaxed Anagenesis (radiation)")

