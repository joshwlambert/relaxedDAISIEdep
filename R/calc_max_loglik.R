#' Finds the maximum loglikelihood and BIC value from a set of replicated models
#'
#' @inheritParams default_params_doc
#' @return list of two numeric elements
#' @export
calc_max_loglik <- function(archipelago,
                            model) {
  results <- NULL
  file_names <- list.files(path = file.path(here::here(), "data", archipelago),
                           pattern = paste(model, "_[[:digit:]]", sep = ""))
  logliks <- c()
  bics <- c()
  for (i in seq_along(file_names)) {
    load(file.path(here::here(), "data", archipelago, file_names[i], sep = ""))
    logliks[i] <- as.numeric(results$ml[6])
    bics[i] <- results$bic
  }
  max_loglik <- max(logliks)
  min_bic <- min(bics)
  global_optim_loglik <- which(max_loglik == logliks)
  global_optim_bic <- which(min_bic == bics)
  testit::assert(global_optim_loglik == global_optim_bic)
  load(file.path(here::here(), "data", archipelago,
                 file_names[global_optim_loglik], sep = ""))
  return(results)
}
