#' Extracts and saves individual archipelago data from the archipelagos41,
#' Bats_GreaterAntilles and frogs_datalist datasets in the DAISIE R package
#'
#' @return String
#' @export
create_data <- function() {
  archipelagos41 <- NULL
  frogs_datalist <- NULL
  Bats_GreaterAntilles <- NULL
  utils::data(archipelagos41, package = "DAISIE")
  utils::data(frogs_datalist, package = "DAISIE")
  utils::data(Bats_GreaterAntilles, package = "DAISIE")
  for (i in seq_along(archipelagos41)) {
    assign(paste(archipelagos41[[i]][[1]]$name), archipelagos41[[i]])
  }

  Aldabra_Group[[1]] <- list(island_age = Aldabra_Group[[1]]$island_age,
                             not_present = Aldabra_Group[[1]]$not_present)
  save(Aldabra_Group, file = "data/Aldabra_Group.RData")

  Azores[[1]] <- list(island_age = Azores[[1]]$island_age,
                      not_present = Azores[[1]]$not_present)
  save(Azores, file = "data/Azores.RData")
  Azores_alt_m <- Azores
  Azores_alt_m[[1]]$not_present <- 300 - (length(Azores) - 1)
  save(Azores_alt_m, file = "data/Azores_alt_m.RData")

  Canaries[[1]] <- list(island_age = Canaries[[1]]$island_age,
                        not_present = Canaries[[1]]$not_present)
  save(Canaries, file = "data/Canaries.RData")
  Canaries_alt_m <- Canaries
  Canaries_alt_m[[1]]$not_present <- 300 - (length(Canaries) - 1)
  save(Canaries_alt_m, file = "data/Canaries_alt_m.RData")

  Cape_Verde[[1]] <- list(island_age = Cape_Verde[[1]]$island_age,
                          not_present = Cape_Verde[[1]]$not_present)
  save(Cape_Verde, file = "data/Cape_Verde.RData")
  Cape_Verde_alt_m <- Cape_Verde
  Cape_Verde_alt_m[[1]]$not_present <- 300 - (length(Cape_Verde) - 1)
  save(Cape_Verde_alt_m, file = "data/Cape_Verde_alt_m.RData")

  Chatham[[1]] <- list(island_age = Chatham[[1]]$island_age,
                       not_present = Chatham[[1]]$not_present)
  save(Chatham, file = "data/Chatham.RData")
  Chatham_alt_m <- Chatham
  Chatham_alt_m[[1]]$not_present <- 300 - (length(Chatham) - 1)
  save(Chatham_alt_m, file = "data/Chatham_alt_m.RData")

  Comoros[[1]] <- list(island_age = Comoros[[1]]$island_age,
                       not_present = Comoros[[1]]$not_present)
  save(Comoros, file = "data/Comoros.RData")

  Galapagos[[1]] <- list(island_age = Galapagos[[1]]$island_age,
                         not_present = Galapagos[[1]]$not_present)
  save(Galapagos, file = "data/Galapagos.RData")
  Galapagos_alt_m <- Galapagos
  Galapagos_alt_m[[1]]$not_present <- 500 - (length(Galapagos) - 1)
  save(Galapagos_alt_m, file = "data/Galapagos_alt_m.RData")

  save(Bats_GreaterAntilles, file = "data/Greater_Antilles.RData")
  Greater_Antilles_alt_m <- Greater_Antilles
  Greater_Antilles_alt_m[[1]]$not_present <- 20 - (length(Greater_Antilles) - 1)
  save(Greater_Antilles_alt_m, file = "data/Greater_Antilles_alt_m.RData")

  Guadalupe[[1]] <- list(island_age = Guadalupe[[1]]$island_age,
                         not_present = Guadalupe[[1]]$not_present)
  save(Guadalupe, file = "data/Guadalupe.RData")
  Guadalupe_alt_m <- Guadalupe
  Guadalupe_alt_m[[1]]$not_present <- 400 - (length(Guadalupe) - 1)
  save(Guadalupe_alt_m, file = "data/Guadalupe_alt_m.RData")

  Hawaii[[1]] <- list(island_age = Hawaii[[1]]$island_age,
                      not_present = Hawaii[[1]]$not_present)
  save(Hawaii, file = "data/Hawaii.RData")
  Hawaii_alt_m <- Hawaii
  Hawaii_alt_m[[1]]$not_present <- 500 - (length(Hawaii) - 1)
  save(Hawaii_alt_m, file = "data/Hawaii_alt_m.RData")

  Juan_Fernandez[[1]] <- list(island_age = Juan_Fernandez[[1]]$island_age,
                              not_present = Juan_Fernandez[[1]]$not_present)
  save(Juan_Fernandez, file = "data/Juan_Fernandez.RData")
  Juan_Fernandez_alt_m <- Juan_Fernandez
  Juan_Fernandez_alt_m[[1]]$not_present <- 300 - (length(Juan_Fernandez) - 1)
  save(Juan_Fernandez_alt_m, file = "data/Juan_Fernandez_alt_m.RData")

  Lord_Howe[[1]] <- list(island_age = Lord_Howe[[1]]$island_age,
                         not_present = Lord_Howe[[1]]$not_present)
  save(Lord_Howe, file = "data/Lord_Howe.RData")
  Lord_Howe_alt_m <- Lord_Howe
  Lord_Howe_alt_m[[1]]$not_present <- 400 - (length(Lord_Howe) - 1)
  save(Lord_Howe_alt_m, file = "data/Lord_Howe_alt_m.RData")

  Madeira[[1]] <- list(island_age = Madeira[[1]]$island_age,
                       not_present = Madeira[[1]]$not_present)
  save(Madeira, file = "data/Madeira.RData")
  Madeira_alt_m <- Madeira
  Madeira_alt_m[[1]]$not_present <- 300 - (length(Madeira) - 1)
  save(Madeira_alt_m, file = "data/Madeira_alt_m.RData")

  Guam_Marianas[[1]] <- list(island_age = Guam_Marianas[[1]]$island_age,
                             not_present = Guam_Marianas[[1]]$not_present)
  save(Guam_Marianas, file = "data/Guam_Marianas.RData")
  Guam_Marianas_alt_m <- Guam_Marianas
  Guam_Marianas_alt_m[[1]]$not_present <- 500 - (length(Guam_Marianas) - 1)
  save(Guam_Marianas_alt_m, file = "data/Guam_Marianas_alt_m.RData")

  Marquesas[[1]] <- list(island_age = Marquesas[[1]]$island_age,
                         not_present = Marquesas[[1]]$not_present)
  save(Marquesas, file = "data/Marquesas.RData")
  Marquesas_alt_m <- Marquesas
  Marquesas_alt_m[[1]]$not_present <- 500 - (length(Marquesas) - 1)
  save(Marquesas_alt_m, file = "data/Marquesas_alt_m.RData")

  Mauritius_Island[[1]] <- list(island_age = Mauritius_Island[[1]]$island_age,
                                not_present = Mauritius_Island[[1]]$not_present)
  save(Mauritius_Island, file = "data/Mauritius_Island.RData")
  Mauritius_Island_alt_m <- Mauritius_Island
  Mauritius_Island_alt_m[[1]]$not_present <- 500 - (length(Mauritius_Island) - 1)
  save(Mauritius_Island_alt_m, file = "data/Mauritius_Island_alt_m.RData")

  New_Caledonia[[1]] <- list(island_age = New_Caledonia[[1]]$island_age,
                             not_present = New_Caledonia[[1]]$not_present)
  save(New_Caledonia, file = "data/New_Caledonia.RData")
  New_Caledonia_alt_m <- New_Caledonia
  New_Caledonia_alt_m[[1]]$not_present <- 400 - (length(New_Caledonia) - 1)
  save(New_Caledonia_alt_m, file = "data/New_Caledonia_alt_m.RData")

  Niue[[1]] <- list(island_age = Niue[[1]]$island_age,
                    not_present = Niue[[1]]$not_present)
  save(Niue, file = "data/Niue.RData")
  Niue_alt_m <- Niue
  Niue_alt_m[[1]]$not_present <- 400 - (length(Niue) - 1)
  save(Niue_alt_m, file = "data/Niue_alt_m.RData")

  Norfolk[[1]] <- list(island_age = Norfolk[[1]]$island_age,
                       not_present = Norfolk[[1]]$not_present)
  save(Norfolk, file = "data/Norfolk.RData")
  Norfolk_alt_m <- Norfolk
  Norfolk_alt_m[[1]]$not_present <- 400 - (length(Norfolk) - 1)
  save(Norfolk_alt_m, file = "data/Norfolk_alt_m.RData")

  Ogasawara[[1]] <- list(island_age = Ogasawara[[1]]$island_age,
                         not_present = Ogasawara[[1]]$not_present)
  save(Ogasawara, file = "data/Ogasawara.RData")
  Ogasawara_alt_m <- Ogasawara
  Ogasawara_alt_m[[1]]$not_present <- 400 - (length(Ogasawara) - 1)
  save(Ogasawara_alt_m, file = "data/Ogasawara_alt_m.RData")

  Palau[[1]] <- list(island_age = Palau[[1]]$island_age,
                     not_present = Palau[[1]]$not_present)
  save(Palau, file = "data/Palau.RData")
  Palau_alt_m <- Palau
  Palau_alt_m[[1]]$not_present <- 500 - (length(Palau) - 1)
  save(Palau_alt_m, file = "data/Palau_alt_m.RData")

  Reunion[[1]] <- list(island_age = Reunion[[1]]$island_age,
                       not_present = Reunion[[1]]$not_present)
  save(Reunion, file = "data/Reunion.RData")
  Reunion_alt_m <- Reunion
  Reunion_alt_m[[1]]$not_present <- 500 - (length(Reunion) - 1)
  save(Reunion_alt_m, file = "data/Reunion_alt_m.RData")

  Samoa[[1]] <- list(island_age = Samoa[[1]]$island_age,
                     not_present = Samoa[[1]]$not_present)
  save(Samoa, file = "data/Samoa.RData")
  Samoa_alt_m <- Samoa
  Samoa_alt_m[[1]]$not_present <- 500 - (length(Samoa) - 1)
  save(Samoa_alt_m, file = "data/Samoa_alt_m.RData")

  SaoTome_Principe[[1]] <- list(island_age = SaoTome_Principe[[1]]$island_age,
                                not_present = SaoTome_Principe[[1]]$not_present)
  save(SaoTome_Principe, file = "data/SaoTome_Principe.RData")
  SaoTome_Principe_alt_m <- SaoTome_Principe
  SaoTome_Principe_alt_m[[1]]$not_present <- 1500 - (length(SaoTome_Principe) - 1)
  save(SaoTome_Principe_alt_m, file = "data/SaoTome_Principe_alt_m.RData")

  Seychelles_Inner[[1]] <- list(island_age = Seychelles_Inner[[1]]$island_age,
                                not_present = Seychelles_Inner[[1]]$not_present)
  save(Seychelles_Inner, file = "data/Seychelles_Inner.RData")
  Socorro[[1]] <- list(island_age = Socorro[[1]]$island_age,
                       not_present = Socorro[[1]]$not_present)
  save(Socorro, file = "data/Socorro.RData")
  Socorro_alt_m <- Socorro
  Socorro_alt_m[[1]]$not_present <- 1500 - (length(Socorro) - 1)
  save(Socorro_alt_m, file = "data/Socorro_alt_m.RData")

  return(message("Finished creating archipelagos"))
}
