#' Runs the maximum likelihood optimisation for a given DAISIE model
#'
#' @inheritParams default_params_doc
#'
#' @export
#'
archipelago_analysis <- function(data,
                                 archipelago,
                                 model,
                                 idparsopt,
                                 parsfix,
                                 idparsfix,
                                 ddmodel,
                                 seed,
                                 relaxed_model,
                                 relaxed_par = NULL,
                                 save_output = TRUE,
                                 verbose = TRUE) {
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
    cs_version <- DAISIE::create_CS_version(model = 2,
                                            relaxed_par = relaxed_par)
  } else {
    cs_version <- 1
  }
  suppressWarnings(suppressMessages(
    ml <- DAISIE::DAISIE_ML_CS(
      datalist = data,
      initparsopt = init_param_set[idparsopt],
      idparsopt = idparsopt,
      parsfix = parsfix,
      idparsfix = idparsfix,
      ddmodel = ddmodel,
      CS_version = cs_version,
      cond = 5)
  ))

  k <- length(idparsopt)
  m <- data[[1]]$not_present + (length(data) - 1)
  bic <- k * (log(m) + log(2 * pi)) - 2 * ml$loglik

  results <- list(
    ml = ml,
    bic = bic)

  if (save_output) {
    model_name <- paste(archipelago, "_", model, "_", seed, ".rds", sep = "")
    dir.create(path = file.path(here::here(), "inst", "results", archipelago,
                                sep = ""), showWarnings = FALSE)
    results_file_path <- file.path(here::here(), "inst", "results", archipelago,
                                   model_name)
    saveRDS(results,
            file = results_file_path)
  } else {
    return(results)
  }
}
