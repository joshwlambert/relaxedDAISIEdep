library(DAISIE)
load("~/github/DAISIE/data/Galapagos_datalist.RData")

CR <- DAISIE_ML_CS(datalist = Galapagos_datalist,
                   initparsopt = c(2.5, 2.7, 20, 0.009, 1.01),
                   idparsopt = 1:5,
                   parsfix = NULL,
                   idparsfix = NULL,
                   ddmodel = 11,
                   CS_version = 1)

relaxed_clado_sd_1 <- DAISIE_ML_CS(datalist = Galapagos_datalist,
                                   initparsopt = c(2, 2.7, 20, 0.009, 1.01),
                                   idparsopt = 1:5,
                                   parsfix = NULL,
                                   idparsfix = NULL,
                                   ddmodel = 11,
                                   CS_version = -2.1)

relaxed_clado_sd_01 <- DAISIE_ML_CS(datalist = Galapagos_datalist,
                                    initparsopt = c(2, 2.7, 20, 0.009, 1.01),
                                    idparsopt = 1:5,
                                    parsfix = NULL,
                                    idparsfix = NULL,
                                    ddmodel = 11,
                                    CS_version = -2.01)

relaxed_clado_sd_001 <- DAISIE_ML_CS(datalist = Galapagos_datalist,
                                     initparsopt = c(2, 2.7, 20, 0.009, 1.01),
                                     idparsopt = 1:5,
                                     parsfix = NULL,
                                     idparsfix = NULL,
                                     ddmodel = 11,
                                     CS_version = -2.001)

relaxed_clado_sd_0001 <- DAISIE_ML_CS(datalist = Galapagos_datalist,
                                      initparsopt = c(2, 2.7, 20, 0.009, 1.01),
                                      idparsopt = 1:5,
                                      parsfix = NULL,
                                      idparsfix = NULL,
                                      ddmodel = 11,
                                      CS_version = -2.0001)

relaxed_clado_sd_00001 <- DAISIE_ML_CS(datalist = Galapagos_datalist,
                                       initparsopt = c(2, 2.7, 20, 0.009, 1.01),
                                       idparsopt = 1:5,
                                       parsfix = NULL,
                                       idparsfix = NULL,
                                       ddmodel = 11,
                                       CS_version = -2.00001)
