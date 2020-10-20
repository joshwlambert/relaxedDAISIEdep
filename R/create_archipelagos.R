#' Extracts and saves individual archipelago data from the archipelagos41
#' dataset in the DAISIE R package
#'
#' @return String
#' @export
#'
#' @examples create_archipelagos()
create_archipelagos <- function() {
  data(archipelagos41, package = "DAISIE")
  for (i in seq_along(archipelagos41)) {
    assign(paste(archipelagos41[[i]][[1]]$name), archipelagos41[[i]])
  }
  Aldabra_Group[[1]] <- list(island_age = Aldabra_Group[[1]]$island_age,
                             not_present = Aldabra_Group[[1]]$not_present)
  save(Aldabra_Group, file = "data/Aldabra_Group.RData")
  Azores[[1]] <- list(island_age = Azores[[1]]$island_age,
                      not_present = Azores[[1]]$not_present)
  save(Azores, file = "data/Azores.RData")
  Canaries[[1]] <- list(island_age = Canaries[[1]]$island_age,
                        not_present = Canaries[[1]]$not_present)
  save(Canaries, file = "data/Canaries.RData")
  Cape_Verde[[1]] <- list(island_age = Cape_Verde[[1]]$island_age,
                          not_present = Cape_Verde[[1]]$not_present)
  save(Cape_Verde, file = "data/Cape_Verde.RData")
  Chatham[[1]] <- list(island_age = Chatham[[1]]$island_age,
                       not_present = Chatham[[1]]$not_present)
  save(Chatham, file = "data/Chatham.RData")
  Comoros[[1]] <- list(island_age = Comoros[[1]]$island_age,
                       not_present = Comoros[[1]]$not_present)
  save(Comoros, file = "data/Comoros.RData")
  Galapagos[[1]] <- list(island_age = Galapagos[[1]]$island_age,
                         not_present = Galapagos[[1]]$not_present)
  save(Galapagos, file = "data/Galapagos.RData")
  Guadalupe[[1]] <- list(island_age = Guadalupe[[1]]$island_age,
                         not_present = Guadalupe[[1]]$not_present)
  save(Guadalupe, file = "data/Guadalupe.RData")
  Hawaii[[1]] <- list(island_age = Hawaii[[1]]$island_age,
                      not_present = Hawaii[[1]]$not_present)
  save(Hawaii, file = "data/Hawaii.RData")
  Juan_Fernandez[[1]] <- list(island_age = Juan_Fernandez[[1]]$island_age,
                              not_present = Juan_Fernandez[[1]]$not_present)
  save(Juan_Fernandez, file = "data/Juan_Fernandez.RData")
  Lord_Howe[[1]] <- list(island_age = Lord_Howe[[1]]$island_age,
                         not_present = Lord_Howe[[1]]$not_present)
  save(Lord_Howe, file = "data/Lord_Howe.RData")
  Madeira[[1]] <- list(island_age = Madeira[[1]]$island_age,
                       not_present = Madeira[[1]]$not_present)
  save(Madeira, file = "data/Madeira.RData")
  Guam_Marianas[[1]] <- list(island_age = Guam_Marianas[[1]]$island_age,
                             not_present = Guam_Marianas[[1]]$not_present)
  save(Guam_Marianas, file = "data/Guam_Marianas.RData")
  Marquesas[[1]] <- list(island_age = Marquesas[[1]]$island_age,
                         not_present = Marquesas[[1]]$not_present)
  save(Marquesas, file = "data/Marquesas.RData")
  Mauritius_Island[[1]] <- list(island_age = Mauritius_Island[[1]]$island_age,
                                not_present = Mauritius_Island[[1]]$not_present)
  save(Mauritius_Island, file = "data/Mauritius_Island.RData")
  New_Caledonia[[1]] <- list(island_age = New_Caledonia[[1]]$island_age,
                             not_present = New_Caledonia[[1]]$not_present)
  save(New_Caledonia, file = "data/New_Caledonia.RData")
  Niue[[1]] <- list(island_age = Niue[[1]]$island_age,
                    not_present = Niue[[1]]$not_present)
  save(Niue, file = "data/Niue.RData")
  Norfolk[[1]] <- list(island_age = Norfolk[[1]]$island_age,
                       not_present = Norfolk[[1]]$not_present)
  save(Norfolk, file = "data/Norfolk.RData")
  Ogasawara[[1]] <- list(island_age = Ogasawara[[1]]$island_age,
                         not_present = Ogasawara[[1]]$not_present)
  save(Ogasawara, file = "data/Ogasawara.RData")
  Palau[[1]] <- list(island_age = Palau[[1]]$island_age,
                     not_present = Palau[[1]]$not_present)
  save(Palau, file = "data/Palau.RData")
  Reunion[[1]] <- list(island_age = Reunion[[1]]$island_age,
                       not_present = Reunion[[1]]$not_present)
  save(Reunion, file = "data/Reunion.RData")
  Samoa[[1]] <- list(island_age = Samoa[[1]]$island_age,
                     not_present = Samoa[[1]]$not_present)
  save(Samoa, file = "data/Samoa.RData")
  SaoTome_Principe[[1]] <- list(island_age = SaoTome_Principe[[1]]$island_age,
                                not_present = SaoTome_Principe[[1]]$not_present)
  save(SaoTome_Principe, file = "data/SaoTome_Principe.RData")
  Seychelles_Inner[[1]] <- list(island_age = Seychelles_Inner[[1]]$island_age,
                                not_present = Seychelles_Inner[[1]]$not_present)
  save(Seychelles_Inner, file = "data/Seychelles_Inner.RData")
  Socorro[[1]] <- list(island_age = Socorro[[1]]$island_age,
                       not_present = Socorro[[1]]$not_present)
  save(Socorro, file = "data/Socorro.RData")

  return(message("Finished creating archipelagos"))
}
