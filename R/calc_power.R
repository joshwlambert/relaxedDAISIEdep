#' Calculates the power for the bootstrapping likelihood ratio test from a
#' single value of the likelihood ratio significance value (lik_ratio_alpha)
#' and a set of likelihood ratios (lik_ratio_model_2).
#'
#' @inheritParams default_params_doc
#'
#' @return numeric
#' @export
#'
calc_power <- function(lik_ratio_alpha,
                       lik_ratio_model_2) {
  testit::assert(is.numeric(lik_ratio_alpha))
  testit::assert(is.numeric(lik_ratio_model_2))
  r_model_2 <- length(which(lik_ratio_model_2 > lik_ratio_alpha))
  power <- r_model_2 / (length(lik_ratio_model_2) + 1)
  return(power)
}
