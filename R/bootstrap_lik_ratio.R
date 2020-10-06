#' Runs the parametric bootstrapping analysis for the best two models from the
#' empirical analysis of all candidate models.
#'
#' @inheritParams default_params_doc
#'
#' @return list of 4 elements each containing a dataframe with the maximum
#' likelihood parameter estimates from bootstrapping
#' @export
#'
#' @examples stub
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
  relaxed_model_1,
  relaxed_model_2,
  relaxed_par_1 = NULL,
  relaxed_par_2 = NULL,
  seed) {

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
      cond = 5)

    message("Estimating under model 1")

    ml_1_model_1 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_1[[1]],
      initparsopt = as.numeric(model_1[1:6]),
      idparsopt = idparsopt_1,
      parsfix = parsfix_1,
      idparsfix = idparsfix_1,
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
      cond = 5)

    message("Estimating under model 1")

    ml_1_model_1 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_1[[1]],
      initparsopt = as.numeric(model_1[1:5]),
      idparsopt = idparsopt_1,
      parsfix = parsfix_1,
      idparsfix = idparsfix_1,
      CS_version = 1,
      cond = 5)
  }

  message("Estimating under model 2")

  if (relaxed_model_2) {
    ml_2_model_1 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_1[[1]],
      initparsopt = as.numeric(model_1[1:6]),
      idparsopt = idparsopt_1,
      parsfix = parsfix_1,
      idparsfix = idparsfix_1,
      CS_version = DAISIE::create_CS_version(
        model = 2,
        relaxed_par = relaxed_par_2),
      cond = 5)
  } else {
    ml_2_model_1 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_1[[1]],
      initparsopt = as.numeric(model_1[1:5]),
      idparsopt = idparsopt_1,
      parsfix = parsfix_1,
      idparsfix = idparsfix_1,
      CS_version = 1,
      cond = 5)
  }

  message("Simulating under model 2")

  if (relaxed_model_2) {
    sim_model_2 <- DAISIE::DAISIE_sim_relaxed_rate(
      time = time,
      M = m,
      pars = as.numeric(model_2[1:6]),
      replicates = 1,
      relaxed_par = relaxed_par_2,
      cond = 5)

    message("Estimating under model 1")

    ml_1_model_2 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_1[[1]],
      initparsopt = as.numeric(model_1[1:6]),
      idparsopt = idparsopt_2,
      parsfix = parsfix_2,
      idparsfix = idparsfix_2,
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
      cond = 5)

    message("Estimating under model 1")

    ml_1_model_2 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_1[[1]],
      initparsopt = as.numeric(model_2[1:5]),
      idparsopt = idparsopt_2,
      parsfix = parsfix_2,
      idparsfix = idparsfix_2,
      CS_version = 1,
      cond = 5)
  }

  message("Estimating under model 2")

  if (relaxed_model_1) {
    ml_2_model_2 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_2[[1]],
      initparsopt = as.numeric(model_2[1:6]),
      idparsopt = idparsopt_2,
      parsfix = parsfix_2,
      idparsfix = idparsfix_2,
      CS_version = DAISIE::create_CS_version(
        model = 2,
        relaxed_par = relaxed_par_2),
      cond = 5)
  } else {
    ml_2_model_2 <- DAISIE::DAISIE_ML_CS(
      datalist = sim_model_2[[1]],
      initparsopt = as.numeric(model_2[1:5]),
      idparsopt = idparsopt_2,
      parsfix = parsfix_2,
      idparsfix = idparsfix_2,
      CS_version = 1,
      cond = 5)
  }
  return(list(ml_1_model_1 = ml_1_model_1,
              ml_2_model_1 = ml_1_model_1,
              ml_1_model_2 = ml_1_model_2,
              ml_2_model_2 = ml_2_model_2))
#
#   lik_ratio_0 <- model_1$loglik - model_2$loglik
#   lik_ratio <- boostrap_ouput$ml_1$loglik - bootstrap_output$ml_2$loglik
#
#
#   r_model_1 <- length(which(lik_ratio > lik_ratio_0))
#   p_value <- (r_model_1 + 1)/(length(lik_ratio) + 1)
#   lik_ratio_alpha <- 100 * (1 - 0.05)
#
#   lik_ratio <- boostrap_output$ml_2$loglik - bootstrap_output$ml_1$loglik
#
#   r_model_2 <- length(which(lik_ratio > lik_ratio_0))
#   power <- r_model_2 / (length(lik_ratio) + 1)
}
