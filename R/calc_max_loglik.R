#' Finds the maximum loglikelihood and BIC value from a set of replicated models
#'
#' @inheritParams default_params_doc
#' @return list of two numeric elements
#' @export
#'
#' @examples output <- calc_max_loglik(archipelago = "Aldabra_Group",
#' model = "cr_di")
calc_max_loglik <- function(archipelago,
                            model) {
  file_names <- list.files(path = file.path(here::here(), "inst", "results",
                                            archipelago),
                           pattern = paste(model, "_[[:digit:]]", sep = ""))
  files <- paste(file.path(here::here(), "inst", "results", archipelago,
                           file_names, sep = ""))
  results <- lapply(files, readRDS)
  mls <- lapply(results, "[[", 1)
  logliks <- as.numeric(unlist(lapply(mls, "[", 6)))
  bics <- unlist(lapply(results, "[[", 2))
  max_loglik <- max(logliks)
  min_bic <- min(bics)
  global_optim_loglik <- which(max_loglik == logliks)
  global_optim_bic <- which(min_bic == bics)
  testit::assert(global_optim_loglik == global_optim_bic)
  return(results[global_optim_loglik])
}
