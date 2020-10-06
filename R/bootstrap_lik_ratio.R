#' Title
#'
#' @param model_1
#' @param model_2
#' @param boostrap_output
#'
#' @return
#' @export
#'
#' @examples
bootstrap_lik_ratio <- function(model_1,
                                model_2,
                                boostrap_output) {
  #Load all the bootstrap ouput
  load()


  lik_ratio_0 <- model_1$loglik - model_2$loglik
  lik_ratio <- boostrap_ouput$ml_1$loglik - bootstrap_output$ml_2$loglik


  r_model_1 <- length(which(lik_ratio > lik_ratio_0))
  p_value <- (r_model_1 + 1)/(length(lik_ratio) + 1)
  lik_ratio_alpha <- 100 * (1 - 0.05)

  lik_ratio <- boostrap_output$ml_2$loglik - bootstrap_output$ml_1$loglik

  r_model_2 <- length(which(lik_ratio > lik_ratio_0))
  power <- r_model_2 / (length(lik_ratio) + 1)
}


