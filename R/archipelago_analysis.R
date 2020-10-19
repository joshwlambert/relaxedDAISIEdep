#' Runs the maximum likelihood optimisation for a given DAISIE model
#'
#' @inheritParams default_params_doc
#'
#' @export
#'
#' @examples output <- archipelago_analysis(
#' data = Aldabra_Group,
#' archipelago = "Aldabra_Group",
#' model = "cr_di",
#' idparsopt = c(1, 2, 3, 4, 5),
#' parsfix = NULL,
#' idparsfix = NULL,
#' ddmodel = 0,
#' seed = 1,
#' relaxed_model = FALSE,
#' save_output = FALSE)
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
                                 save_output = TRUE) {
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
    CS_version <- DAISIE::create_CS_version(model = 2, #nolint
                                            relaxed_par = relaxed_par)
  } else {
    CS_version <- 1 #nolint
  }
  suppressMessages(
    init_ml <- DAISIE::DAISIE_ML_CS(
      datalist = data,
      initparsopt = init_param_set[idparsopt],
      idparsopt = idparsopt,
      parsfix = parsfix,
      idparsfix = idparsfix,
      ddmodel = ddmodel,
      optimmethod = "simplex",
      CS_version = CS_version,
      cond = 5)
  )

  suppressMessages(
    ml <- DAISIE::DAISIE_ML_CS(
      datalist = data,
      initparsopt = as.numeric(init_ml)[idparsopt],
      idparsopt = idparsopt,
      parsfix = parsfix,
      idparsfix = idparsfix,
      ddmodel = ddmodel,
      optimmethod = "simplex",
      CS_version = CS_version,
      cond = 5)
  )

  k <- length(idparsopt)
  m <- data[[1]]$not_present + (length(data) - 1)
  bic <- k * (log(m) + log(2 * pi)) - 2 * ml$loglik

  results <- list(
    ml = ml,
    bic = bic)

  if (save_output) {
    print("step 1")
    model_name <- paste(archipelago, "_", model, "_", seed, ".rds", sep = "")
    print("step 2")
    dir.create(path = file.path(here::here(), "inst", "results", archipelago,
                                sep = ""), showWarnings = FALSE)
    print("step 3")
    results_file_path <- file.path(here::here(), "inst", "results", archipelago,
                                   model_name)
    print("step 4")
    saveRDS(results,
            file = results_file_path)
  } else {
    return(results)
  }
}
