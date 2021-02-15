#' Calculates the difference in likelihood for a clade (single lineage or
#' radiation) across different standard deviations of gamma distribution of
#' the relaxed-rate DAISIE model.
#'
#' @param parameter A string defining which parameter to relaxed. Options are:
#' \code{"cladogenesis"}, \code{"extinction"}, \code{"carrying_capacity"}, or
#' \code{"anagenesis"}.
#' @param clade A string defining whether to use single lineage or a radiation.
#' Options are: \code{"lineage"} or \code{"radiation"}.
#'
#' @return A list of two numeric vectors
#' @export
#'
calc_rr_approach_cr <- function(parameter = "cladogenesis",
                                clade = "lineage") {
  pars1 <- c(2.500, 2.700, 20.000, 0.009, 1.010)
  pars2 <- c(1.0e+02, 1.1e+01, 0.0e+00, 0.0e+00, NA, 0.0e+00, 1.0e-04,
             1.0e-05, 1.0e-07, 3.0e+03, 9.5e-01, 9.8e-01)
  missnumspec <- 0
  methode <- "lsodes"
  abstolint <- 1e-16
  reltolint <- 1e-10
  verbose <- FALSE

  if (clade == "lineage") {
    brts <- 4
    stac <- 0
  }
  if (clade == "radiation") {
    brts <- c(4.0000, 3.0282, 1.3227, 0.8223, 0.4286, 0.3462, 0.2450, 0.0808,
              0.0527, 0.0327, 0.0221, 0.1180, 0.0756, 0.0525, 0.0322, 0.0118)
    stac <- 2
  }

  lik <- DAISIE:::DAISIE_loglik(
    pars1 = pars1,
    pars2 = pars2,
    brts = brts,
    stac = stac,
    missnumspec = missnumspec,
    methode = methode,
    abstolint = abstolint,
    reltolint = reltolint,
    verbose = verbose)

  sd <- c()
  lik_integrated <- c()
  x <- 1
  for (i in seq(0.1, 5, 0.1)) {
    sd[x] <- i
    CS_version <- list( #nolint
      model = 2,
      relaxed_par = parameter,
      sd = i)
    lik_integrated[x] <- DAISIE:::DAISIE_loglik_integrate(
      pars1 = pars1,
      pars2 = pars2,
      brts = brts,
      stac = stac,
      missnumspec = missnumspec,
      methode = methode,
      CS_version = CS_version,
      abstolint = abstolint,
      reltolint = reltolint,
      verbose = verbose
    )
    x <- x + 1
  }
  delta_likelihood <- abs(lik - lik_integrated)
  return(list(sd = sd,
              delta_likelihood = delta_likelihood))
}
