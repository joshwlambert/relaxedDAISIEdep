#' Runs the maximum likelihood optimisation for a given DAISIE model
#'
#' @param data list of DAISIE data
#' @param archipelago string with the name of the archipelago
#' @param idparsopt numeric vector with the id of parameters to optimise
#' @param parsfix numeric vector with the value of the fixed parameters
#' @param idparsfix numeric vector with the id of parameters to fix
#' @param ddmodel numeric determining diversity-independence or -dependence
#' @param seed numeric seed for the simulation
#' @param relaxed_model boolean defining if the model is relaxed-rate
#' @param relaxed_par string determining which parameter to relax
#'
#' @export
#'
#' @examples output <- archipelago_analysis(
#' data = Aldabra_Group,
#' archipelago = "Aldabra_Group",
#' idparsopt = c(1,2,3,4,5),
#' parsfix = NULL,
#' idparsfix = NULL,
#' ddmodel = 0,
#' seed = 1,
#' relaxed_model = FALSE)
archipelago_analysis <- function(data,
                                 archipelago,
                                 idparsopt,
                                 parsfix,
                                 idparsfix,
                                 ddmodel,
                                 seed,
                                 relaxed_model,
                                 relaxed_par = NULL) {
  set.seed(seed = seed,
           kind = "Mersenne-Twister",
           normal.kind = "Inversion",
           sample.kind = "Rejection")
  init_param_set <- stats::runif(2, 0.1, 2)
  init_param_set[3] <- stats::runif(1, 30, 100)
  init_param_set[4] <- stats::runif(1, 0.001, 0.01)
  init_param_set[5] <- stats::runif(1, 0.1, 2)
  init_param_set[6] <- stats::runif(1, 0.1, 1)

  init_ml <- list()
  ml <- list()

  if (relaxed_model) {
    CS_version <- DAISIE::create_CS_version(model = 2,
                                            relaxed_par = relaxed_par)
  } else {
    CS_version <- 1
  }

  init_ml <- DAISIE::DAISIE_ML_CS(
    datalist = data,
    initparsopt = init_param_set[idparsopt],
    idparsopt = idparsopt,
    parsfix = parsfix,
    idparsfix = idparsfix,
    ddmodel = ddmodel,
    optimmethod = "simplex",
    CS_version = CS_version)

  ml <- DAISIE::DAISIE_ML_CS(
    datalist = data,
    initparsopt = as.numeric(init_ml)[idparsopt],
    idparsopt = idparsopt,
    parsfix = parsfix,
    idparsfix = idparsfix,
    ddmodel = ddmodel,
    optimmethod = "simplex",
    CS_version = CS_version)

  k <- length(idparsopt)
  m <- data[[1]]$not_present + (length(data) - 1)
  BIC <- k * (log(m) + log(2 * pi)) - 2 * ml$loglik


  if (relaxed_model) {
    if (ddmodel == 11) {
      model_name <- paste(archipelago, "_rr_", relaxed_par, "_dd_", seed, ".RData", sep = "")
    } else {
      model_name <- paste(archipelago, "_rr_", relaxed_par, "_di_", seed, ".RData", sep = "")
    }
  } else {
    if (ddmodel == 11) {
      model_name <- paste(archipelago, "_cr_", "dd_", seed, ".RData", sep = "")
    } else {
      model_name <- paste(archipelago, "_cr_", "di_", seed, ".RData", sep = "")
    }
  }

  dir.create("results", showWarnings = FALSE)
  dir.create(path = paste("results/", archipelago, sep = ""),
             showWarnings = FALSE)
  results_file_path <- file.path(getwd(), "results", archipelago, model_name)
  results <- list(
     ml = ml,
     BIC = BIC)

   save(results,
        file = results_file_path)
}
