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

