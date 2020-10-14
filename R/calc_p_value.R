#' Calculates the p value for the bootstrapping likelihood ratio test from a
#' single value of likelihood ratio zeor (lik_ratio_0) and a set of likelihood
#' ratios (likelihood_ratio_model_1).
#'
#' @inheritParams default_params_doc
#'
#' @return numeric
#' @export
#'
#' @examples output <- calc_p_value(lik_ratio_0 = 10,
#'                                  lik_ratio_model_1 = runif(1000, 0, 100))
calc_p_value <- function(lik_ratio_0,
                         lik_ratio_model_1) {
  r_model_1 <- length(which(lik_ratio_model_1 > lik_ratio_0))
  p_value <- (r_model_1 + 1) / (length(lik_ratio_model_1) + 1)
  return(p_value)
}
