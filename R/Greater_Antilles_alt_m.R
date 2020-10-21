#' Bats of the Greater Antilles archipelago  with alternative mainland species
#' pool size
#'
#' A dataset containing the age of the archipelago, number of species on
#' mainland not present on the island, and each colonising clade with
#' colonisation and branching times, endemicity status, missing species, and the
#' type of species.
#'
#' @format An object of class \code{list} of length 17:
#' \describe{
#'   \item{island_age}{Age of the island}
#'   \item{not_present}{Number of mainland species that did not colonise the
#'   island}
#'   \item{colonist_name}{The name of the colonising clade}
#'   \item{branching_times}{The age of the island and the colonisation and
#'   subsequent branching times for a clade}
#'   \item{stac}{Endemicity status for a clade}
#'   \item{missing_species}{Number of species missing from a phylogeny of a
#'   clade}
#'   \item{type1or2}{Defines what type of species are in a clade, used for
#'   2-type analysis}
#'   ...
#' }
#' @source Valente et al. (2017) doi:
#' \url{https://doi.org/10.1038/s41559-016-0026}
"Greater_Antilles_alt_m"
