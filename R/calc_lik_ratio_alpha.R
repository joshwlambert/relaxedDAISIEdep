#' Calculates the likelihood ratio significance value (lik_ratio_alpha) at
#' significance threshold of 0.05.
#'
#' @inheritParams default_params_doc
#'
#' @return numeric
#' @export
#'
calc_lik_ratio_alpha <- function(lik_ratio_model_1) {
  testit::assert(is.numeric(lik_ratio_model_1))
  lik_ratio_alpha <- as.numeric(stats::quantile(lik_ratio_model_1,
                  1 - 0.05,
                  type = 4))
  return(lik_ratio_alpha)
}
