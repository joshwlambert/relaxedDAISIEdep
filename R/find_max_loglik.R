#' Finds the maximum loglikelihood and BIC value from a set of replicated models
#'
#' @inheritParams default_params_doc
#' @return list of two numeric elements
#' @export
find_max_loglik <- function(archipelago) {

  setwd(file.path(getwd(), "results", archipelago))
  for (i in length(list.files())) {
    file_names <- list.files()
    results <- lapply(file_names, load)
    mls <- lapply(max_logliks, '[[', 1)
    max_loglik <- max(unlist(lapply(mls, '[[', 6)))
    max_bic <- max(unlist(lapply(max_logliks, '[[', 2)))
  }

  return(list(max_loglik = max_loglik,
              BIC = max_BIC))
}
