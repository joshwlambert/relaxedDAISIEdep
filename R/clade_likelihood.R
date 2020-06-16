library(DAISIE)
load("~/github/DAISIE/data/Galapagos_datalist.RData")
datalist <- Galapagos_datalist
idparsopt <- c(1,2,4,5)
clade_likelihood <- list()
island_likelihood <- list()

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

  for (j in 2:length(datalist)) {
    clade_likelihood[[i]][[j]] <- DAISIE_loglik_CS_choice(
      pars1 = pars1,
      pars2 = pars2,
      brts = datalist[[j]]$branching_times,
      stac = datalist[[j]]$stac,
      missnumspec = datalist[[j]]$missing_species,
      methode = "lsodes",
      CS_version = 1,
      abstolint = 1E-16,
      reltolint = 1E-10,
      verbose = 0)
  }
  island_likelihood[[i]] <- sum(unlist(clade_likelihood[[i]]))
}
clade_likelihood[[21]] <- list()
pars1 <- c(2.50, 2.70, Inf, 0.009, 1.010)
for (j in 2:length(datalist)) {
  clade_likelihood[[21]][[j]] <- DAISIE_loglik_CS_choice(
    pars1 = pars1,
    pars2 = pars2,
    brts = datalist[[j]]$branching_times,
    stac = datalist[[j]]$stac,
    missnumspec = datalist[[j]]$missing_species,
    methode = "lsodes",
    CS_version = 1,
    abstolint = 1E-16,
    reltolint = 1E-10,
    verbose = 0)
}
island_likelihood[[21]] <- sum(unlist(clade_likelihood[[21]]))
