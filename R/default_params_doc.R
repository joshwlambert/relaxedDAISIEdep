#' Document to inherit the function documentation
#' @param data list of DAISIE data
#' @param archipelago string with the name of the archipelago
#' @param model string with the name of the model
#' @param idparsopt numeric vector with the id of parameters to optimise
#' @param parsfix numeric vector with the value of the fixed parameters
#' @param idparsfix numeric vector with the id of parameters to fix
#' @param ddmodel numeric determining diversity-independence or -dependence
#' @param seed numeric seed for the simulation
#' @param relaxed_model boolean defining if the model is relaxed-rate
#' @param relaxed_par string determining which parameter to relax, only required
#' if relaxed_model is TRUE
#' @param save_output boolean determining whether the output is saved or
#' returned
#' @param model_1 dataframe containing the maximum likelihood output of a model
#' from the function \code{archipelago_analysis}
#' @param model_2 dataframe containing the maximum likelihood output of a model
#' from the function \code{archipelago_analysis}
#' @param idparsopt_1 numeric vector with the id of parameters to optimise
#' @param idparsopt_2 numeric vector with the id of parameters to optimise
#' @param parsfix_1 numeric vector with the value of the fixed parameters
#' @param parsfix_2 numeric vector with the value of the fixed parameters
#' @param idparsfix_1 numeric vector with the id of parameters to fix
#' @param idparsfix_2 numeric vector with the id of parameters to fix
#' @param ddmodel_1 numeric determining diversity-dependence in the model
#' @param ddmodel_2 numeric determining diversity-dependence in the model
#' @param relaxed_model_1 boolean defining if the model is relaxed-rate
#' @param relaxed_model_2 boolean defining if the model is relaxed-rate
#' @param relaxed_par_1 string determining which parameter to relax, only
#' required if relaxed_model is TRUE
#' @param relaxed_par_2 string determining which parameter to relax, only
#' required if relaxed_model is TRUE
default_params_doc <- function(
  data,
  archipelago,
  model,
  idparsopt,
  parsfix,
  idparsfix,
  ddmodel,
  seed,
  relaxed_model,
  relaxed_par,
  save_output,
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
  relaxed_par_1,
  relaxed_par_2
) {
  # Nothing
}
