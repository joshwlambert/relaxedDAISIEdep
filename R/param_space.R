#' Parameter space used to generate simulation data for constant-rate and
#' relaxed-rate models
#'
#' A dataset containing the cladogenesis, extinction, carrying capacity,
#' immigration, anagenesis, and standard deviation of the gamma distribution
#' used to simulate data.
#'
#' @format An object of class \code{data.frame}:
#' \describe{
#'   \item{lac}{cladogenesis rate}
#'   \item{mu}{extinction rate}
#'   \item{K}{clade-specific carrying capacity}
#'   \item{gam}{immigration rate}
#'   \item{laa}{anagenesis rate}
#'   \item{sd}{standard deviation of the gamma distribution to vary on of the
#'   parameters in the relaxed-rate models}
#' }
"param_space"
