#' Creates and saves archipelago data with alternative mainland species pool
#' size
#'
#' @return String
#' @export
#'
#' @examples \dontrun{create_archipelagos_alt_m()}
create_archipelagos_alt_m <- function() {
  file_paths <- file.path(
    here::here(), "data",
    list.files(path = file.path(here::here(), "data")))
  data <- lapply(file_paths, load)
  Azores_alt_m <- Azores
  Azores_alt_m[[1]]$not_present <- 300 - (length(Azores) - 1)
  save(Azores_alt_m, file = "data/Azores_alt_m.RData")
  Canaries_alt_m <- Canaries
  Canaries_alt_m[[1]]$not_present <- 300 - (length(Canaries) - 1)
  save(Canaries_alt_m, file = "data/Canaries_alt_m.RData")
  Cape_Verde_alt_m <- Cape_Verde
  Cape_Verde_alt_m[[1]]$not_present <- 300 - (length(Cape_Verde) - 1)
  save(Cape_Verde_alt_m, file = "data/Cape_Verde_alt_m.RData")
  Chatham_alt_m <- Chatham
  Chatham_alt_m[[1]]$not_present <- 300 - (length(Chatham) - 1)
  save(Chatham_alt_m, file = "data/Chatham_alt_m.RData")
  Galapagos_alt_m <- Galapagos
  Galapagos_alt_m[[1]]$not_present <- 500 - (length(Galapagos) - 1)
  save(Galapagos_alt_m, file = "data/Galapagos_alt_m.RData")
  Greater_Antilles_alt_m <- Greater_Antilles
  Greater_Antilles_alt_m[[1]]$not_present <- 20 - (length(Greater_Antilles) - 1)
  save(Greater_Antilles_alt_m, file = "data/Greater_Antilles_alt_m.RData")
  Guadalupe_alt_m <- Guadalupe
  Guadalupe_alt_m[[1]]$not_present <- 400 - (length(Guadalupe) - 1)
  save(Guadalupe_alt_m, file = "data/Guadalupe_alt_m.RData")
  Hawaii_alt_m <- Hawaii
  Hawaii_alt_m[[1]]$not_present <- 500 - (length(Hawaii) - 1)
  save(Hawaii_alt_m, file = "data/Hawaii_alt_m.RData")
  Juan_Fernandez_alt_m <- Juan_Fernandez
  Juan_Fernandez_alt_m[[1]]$not_present <- 300 - (length(Juan_Fernandez) - 1)
  save(Juan_Fernandez_alt_m, file = "data/Juan_Fernandez_alt_m.RData")
  Lord_Howe_alt_m <- Lord_Howe
  Lord_Howe_alt_m[[1]]$not_present <- 400 - (length(Lord_Howe) - 1)
  save(Lord_Howe_alt_m, file = "data/Lord_Howe_alt_m.RData")
  Madeira_alt_m <- Madeira
  Madeira_alt_m[[1]]$not_present <- 300 - (length(Madeira) - 1)
  save(Madeira_alt_m, file = "data/Madeira_alt_m.RData")
  Guam_Marianas_alt_m <- Guam_Marianas
  Guam_Marianas_alt_m[[1]]$not_present <- 500 - (length(Guam_Marianas) - 1)
  save(Guam_Marianas_alt_m, file = "data/Guam_Marianas_alt_m.RData")
  Marquesas_alt_m <- Marquesas
  Marquesas_alt_m[[1]]$not_present <- 500 - (length(Marquesas) - 1)
  save(Marquesas_alt_m, file = "data/Marquesas_alt_m.RData")
  Mauritius_Island_alt_m <- Mauritius_Island
  Mauritius_Island_alt_m[[1]]$not_present <- 500 - (length(Mauritius_Island) - 1)
  save(Mauritius_Island_alt_m, file = "data/Mauritius_Island_alt_m.RData")
  New_Caledonia_alt_m <- New_Caledonia
  New_Caledonia_alt_m[[1]]$not_present <- 400 - (length(New_Caledonia) - 1)
  save(New_Caledonia_alt_m, file = "data/New_Caledonia_alt_m.RData")
  Niue_alt_m <- Niue
  Niue_alt_m[[1]]$not_present <- 400 - (length(Niue) - 1)
  save(Niue_alt_m, file = "data/Niue_alt_m.RData")
  Norfolk_alt_m <- Norfolk
  Norfolk_alt_m[[1]]$not_present <- 400 - (length(Norfolk) - 1)
  save(Norfolk_alt_m, file = "data/Norfolk_alt_m.RData")
  Ogasawara_alt_m <- Ogasawara
  Ogasawara_alt_m[[1]]$not_present <- 400 - (length(Ogasawara) - 1)
  save(Ogasawara_alt_m, file = "data/Ogasawara_alt_m.RData")
  Palau_alt_m <- Palau
  Palau_alt_m[[1]]$not_present <- 500 - (length(Palau) - 1)
  save(Palau_alt_m, file = "data/Palau_alt_m.RData")
  Reunion_alt_m <- Reunion
  Reunion_alt_m[[1]]$not_present <- 500 - (length(Reunion) - 1)
  save(Reunion_alt_m, file = "data/Reunion_alt_m.RData")
  Samoa_alt_m <- Samoa
  Samoa_alt_m[[1]]$not_present <- 500 - (length(Samoa) - 1)
  save(Samoa_alt_m, file = "data/Samoa_alt_m.RData")
  SaoTome_Principe_alt_m <- SaoTome_Principe
  SaoTome_Principe_alt_m[[1]]$not_present <- 1500 - (length(SaoTome_Principe) - 1)
  save(SaoTome_Principe_alt_m, file = "data/SaoTome_Principe_alt_m.RData")
  Socorro_alt_m <- Socorro
  Socorro_alt_m[[1]]$not_present <- 1500 - (length(Socorro) - 1)
  save(Socorro_alt_m, file = "data/Socorro_alt_m.RData")

  return(message("Finished creating archipelagos"))
}

