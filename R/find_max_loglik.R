#' Finds the maximum loglikelihood and BIC value from a set of replicated models
#'
#' @param archipelago string with the name of the archipelago
#' @param model string with the name of the model
#'
#' @return list of two numeric elements
#' @export
find_max_loglik <- function(archipelago,
                            model) {
  model_names <- list()
  logliks <- list()
  BICs <- list()
  for (i in 1:10) {
    model_names[[i]] <- paste(archipelago, "_", model, "_", i, ".RData", sep = "")
    load(file = model_names[[i]])
    logliks[[i]] <- results$ml$loglik
    BICs[[i]] <- results$BIC
  }

  max_loglik <- max(unlist(logliks))
  ml <- ml
  BIC <- BICs[[which(logliks == max_loglik)]]

  return(list(max_loglik = max_loglik,
              BIC = BIC))
}
