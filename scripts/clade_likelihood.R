library(DAISIE)
library(ggplot2)

data(Galapagos_datalist)

#remove the first element which is not clade information
Galapagos_datalist <- Galapagos_datalist[-1]

idparsopt <- c(1, 2, 4, 5)

clade_likelihood <- list()

for (i in 1:20) {
  clade_likelihood[[i]] <- list()

  pars1 <- c(2.56, 2.69, i, 0.009, 1.010)

  pars2 <- c(
    res = 100,
    ddmodel = 11,
    cond = 0,
    verbose = 0,
    island_ontogeny = NA,
    eqmodel = 0,
    tol = c(1E-4, 1E-5, 1E-7),
    maxiter = 1000 * round((1.25) ^ length(idparsopt)),
    x_E = 0.95,
    x_I = 0.98
  )

  for (j in seq_along(Galapagos_datalist)) {
    clade_likelihood[[i]][[j]] <- DAISIE:::DAISIE_loglik_CS_choice(
      pars1 = pars1,
      pars2 = pars2,
      brts = Galapagos_datalist[[j]]$branching_times,
      stac = Galapagos_datalist[[j]]$stac,
      missnumspec = Galapagos_datalist[[j]]$missing_species,
      methode = "lsodes",
      CS_version = 1,
      abstolint = 1E-16,
      reltolint = 1E-10,
      verbose = 0)
  }
}
clade_likelihood[[21]] <- list()
pars1 <- c(2.50, 2.70, Inf, 0.009, 1.010)
for (j in seq_along(Galapagos_datalist)) {
  clade_likelihood[[21]][[j]] <- DAISIE:::DAISIE_loglik_CS_choice(
    pars1 = pars1,
    pars2 = pars2,
    brts = Galapagos_datalist[[j]]$branching_times,
    stac = Galapagos_datalist[[j]]$stac,
    missnumspec = Galapagos_datalist[[j]]$missing_species,
    methode = "lsodes",
    CS_version = 1,
    abstolint = 1E-16,
    reltolint = 1E-10,
    verbose = 0)
}

#plots
Coccyzus_loglik <- sapply(clade_likelihood, '[[', 1)
Dendroica_loglik <- sapply(clade_likelihood, '[[', 2)
Finches_loglik <- sapply(clade_likelihood, '[[', 3)
Mimus_loglik <- sapply(clade_likelihood, '[[', 4)
Myiarchus_loglik <- sapply(clade_likelihood, '[[', 5)
Progne_loglik <- sapply(clade_likelihood, '[[', 6)
Pyrocephalus_loglik <- sapply(clade_likelihood, '[[', 7)
Zenaida_loglik <- sapply(clade_likelihood, '[[', 8)

clade_likelihood_df <- data.frame(Coccyzus_loglik,
                                  Dendroica_loglik,
                                  Finches_loglik,
                                  Mimus_loglik,
                                  Myiarchus_loglik,
                                  Progne_loglik,
                                  Pyrocephalus_loglik,
                                  Zenaida_loglik,
                                  Carrying_capacity = c(1:20, Inf),
                                  x_lab = 1:21)

ggplot(Coccyzus, aes(x = Carrying_capacity,
                     y = Coccyzus_loglik)) +
  geom_point() +
  theme_bw() +
  xlab("Carrying Capacity (K')") +
  ylab("Coccyzus log likelihood") +
  expand_limits(x = 0) +
  scale_x_continuous(breaks = Coccyzus$x_lab,
                     labels = Coccyzus$Carrying_capacity)

