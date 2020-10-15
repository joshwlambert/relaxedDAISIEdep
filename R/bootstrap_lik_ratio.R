#' Runs the parametric bootstrapping analysis for the best two models from the
#' empirical analysis of all candidate models.
#'
#' @inheritParams default_params_doc
#'
#' @return list of 4 elements each containing a dataframe with the maximum
#' likelihood parameter estimates from bootstrapping
#' @export
#'
#' @examples output <- relaxedDAISIE::bootstrap_lik_ratio(
#' data = Aldabra_Group,
#' archipelago = "Aldabra_Group",
#' model_1 = data.frame(lambda_c = 0.8135786,
#'                      mu = 0.6530319,
#'                      K = 0.5210479,
#'                      gamma = 0.01645943,
#'                      lambda_a = 1.01026,
#'                      loglik = -73.36238,
#'                      df = 5,
#'                      conv = 0),
#' model_2 = data.frame(lambda_c = 0.8135786,
#'                      mu = 0.6530319,
#'                      K = 0.5210479,
#'                      gamma = 0.01645943,
#'                      lambda_a = 1.01026,
#'                      loglik = -73.36238,
#'                      df = 5,
#'                      conv = 0),
#' idparsopt_1 = c(1, 2, 3, 4, 5),
#' idparsopt_2 = c(1, 2, 4, 5),
#' parsfix_1 = NULL,
#' parsfix_2 = Inf,
#' idparsfix_1 = NULL,
#' idparsfix_2 = 3,
#' ddmodel_1 = 11,
#' ddmodel_2 = 0,
#' relaxed_model_1 = FALSE,
#' relaxed_model_2 = FALSE,
#' relaxed_par_1 = NULL,
#' relaxed_par_2 = NULL,
#' seed = 1,
#' save_output = FALSE)
bootstrap_lik_ratio <- function(
  data,
  archipelago,
  model_1,
  model_2,
  idparsopt_1,
  idparsopt_2,
  parsfix_1,
  parsfix_2,
  idparsfix_1,
  idparsfix_2,
  ddmodel_1,
  ddmodel_2,
  relaxed_model_1,
  relaxed_model_2,
  relaxed_par_1 = NULL,
  relaxed_par_2 = NULL,
  seed,
  save_output = TRUE) {

  lik_ratio_0 <- model_1$loglik - model_2$loglik

  set.seed(
    seed = seed,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection")

  time <- data[[1]]$island_age
  m <- data[[1]]$not_present + (length(data) - 1)

  message("Simulating under model 1")

  if (relaxed_model_1) {
    sim_model_1 <- DAISIE::DAISIE_sim_relaxed_rate(
      time = time,
      M = m,
      pars = as.numeric(model_1[1:6]),
      replicates = 1,
      relaxed_par = relaxed_par_1,
      cond = 5,
      plot_sims = FALSE)

    message("Estimating under model 1")

    ml_1_model_1 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_1[[1]],
      initparsopt = as.numeric(model_1[1:6])[idparsopt_1],
      idparsopt = idparsopt_1,
      parsfix = parsfix_1,
      idparsfix = idparsfix_1,
      ddmodel = ddmodel_1,
      optimmethod = "simplex",
      CS_version = DAISIE::create_CS_version(
        model = 2,
        relaxed_par = relaxed_par_1),
      cond = 5)
  } else {
    sim_model_1 <- DAISIE::DAISIE_sim_constant_rate(
      time = time,
      M = m,
      pars = as.numeric(model_1[1:5]),
      replicates = 1,
      cond = 5,
      plot_sims = FALSE)

    message("Estimating under model 1")

    ml_1_model_1 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_1[[1]],
      initparsopt = as.numeric(model_1[1:5])[idparsopt_1],
      idparsopt = idparsopt_1,
      parsfix = parsfix_1,
      idparsfix = idparsfix_1,
      ddmodel = ddmodel_1,
      optimmethod = "simplex",
      CS_version = 1,
      cond = 5)
  }

  message("Estimating under model 2")

  if (relaxed_model_2) {
    ml_2_model_1 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_1[[1]],
      initparsopt = as.numeric(model_1[1:6])[idparsopt_1],
      idparsopt = idparsopt_1,
      parsfix = parsfix_1,
      idparsfix = idparsfix_1,
      ddmodel = ddmodel_1,
      optimmethod = "simplex",
      CS_version = DAISIE::create_CS_version(
        model = 2,
        relaxed_par = relaxed_par_2),
      cond = 5)
  } else {
    ml_2_model_1 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_1[[1]],
      initparsopt = as.numeric(model_2[1:5])[idparsopt_2],
      idparsopt = idparsopt_2,
      parsfix = parsfix_2,
      idparsfix = idparsfix_2,
      ddmodel = ddmodel_2,
      optimmethod = "simplex",
      CS_version = 1,
      cond = 5)
  }

  lik_ratio_model_1 <- ml_1_model_1$loglik - ml_2_model_1$loglik

  message("Simulating under model 2")

  if (relaxed_model_2) {
    sim_model_2 <- DAISIE::DAISIE_sim_relaxed_rate(
      time = time,
      M = m,
      pars = as.numeric(model_2[1:6]),
      replicates = 1,
      relaxed_par = relaxed_par_2,
      cond = 5,
      plot_sims = FALSE)

    message("Estimating under model 1")

    ml_1_model_2 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_2[[1]],
      initparsopt = as.numeric(model_1[1:6])[idparsopt_1],
      idparsopt = idparsopt_1,
      parsfix = parsfix_1,
      idparsfix = idparsfix_1,
      ddmodel = ddmodel_1,
      optimmethod = "simplex",
      CS_version = DAISIE::create_CS_version(
        model = 2,
        relaxed_par = relaxed_par_2),
      cond = 5)
  } else {
    sim_model_2 <- DAISIE::DAISIE_sim_constant_rate(
      time = time,
      M = m,
      pars = as.numeric(model_2[1:5]),
      replicates = 1,
      cond = 5,
      plot_sims = FALSE)

    message("Estimating under model 1")

    ml_1_model_2 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_2[[1]],
      initparsopt = as.numeric(model_2[1:5])[idparsopt_1],
      idparsopt = idparsopt_1,
      parsfix = parsfix_1,
      idparsfix = idparsfix_1,
      ddmodel = ddmodel_1,
      optimmethod = "simplex",
      CS_version = 1,
      cond = 5)
  }

  message("Estimating under model 2")

  if (relaxed_model_1) {
    ml_2_model_2 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_2[[1]],
      initparsopt = as.numeric(model_2[1:6])[idparsopt_2],
      idparsopt = idparsopt_2,
      parsfix = parsfix_2,
      idparsfix = idparsfix_2,
      ddmodel = ddmodel_2,
      optimmethod = "simplex",
      CS_version = DAISIE::create_CS_version(
        model = 2,
        relaxed_par = relaxed_par_2),
      cond = 5)
  } else {
    ml_2_model_2 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_2[[1]],
      initparsopt = as.numeric(model_2[1:5])[idparsopt_2],
      idparsopt = idparsopt_2,
      parsfix = parsfix_2,
      idparsfix = idparsfix_2,
      ddmodel = ddmodel_2,
      optimmethod = "simplex",
      CS_version = 1,
      cond = 5)
  }

  lik_ratio_model_2 <- ml_1_model_2$loglik - ml_2_model_2$loglik

  results <- list(lik_ratio_0 = lik_ratio_0,
                  lik_ratio_model_1 = lik_ratio_model_1,
                  lik_ratio_model_2 = lik_ratio_model_2)

  if (save_output) {
    results_file_path <- file.path(getwd(), "results", archipelago)
    save(results,
         file = results_file_path)
  } else {
    return(results)
  }
}
