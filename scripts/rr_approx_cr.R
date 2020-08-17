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

rr_clado_sd_1 <- DAISIE_ML_CS(
  datalist = Galapagos_datalist,
  initparsopt = c(2, 2.7, 20, 0.009, 1.01),
  idparsopt = 1:5,
  parsfix = 1,
  idparsfix = 6,
  ddmodel = 11,
  optimmethod = "simplex",
  CS_version = create_CS_version(model = 2,
                                 relaxed_par = "cladogenesis"))


rr_clado_sd_001 <- DAISIE_ML_CS(
  datalist = Galapagos_datalist,
  initparsopt = c(2, 2.7, 20, 0.009, 1.01),
  idparsopt = 1:5,
  parsfix = 0.01,
  idparsfix = 6,
  ddmodel = 11,
  optimmethod = "simplex",
  CS_version = create_CS_version(model = 2,
                                 relaxed_par = "cladogenesis"))

rr_clado_sd_00001 <- DAISIE_ML_CS(
  datalist = Galapagos_datalist,
  initparsopt = c(2, 2.7, 20, 0.009, 1.01),
  idparsopt = 1:5,
  parsfix = 0.0001,
  idparsfix = 6,
  ddmodel = 11,
  optimmethod = "simplex",
  CS_version = create_CS_version(model = 2,
                                 relaxed_par = "cladogenesis"))
