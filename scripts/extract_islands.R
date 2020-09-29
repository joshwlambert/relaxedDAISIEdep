library(DAISIE)
data(archipelagos41)

#Split archipelagos into separate lists
for (i in seq_along(archipelagos41)) {
  assign(paste(archipelagos41[[i]][[1]]$name), archipelagos41[[i]])
}

### Aldabra_Group ###

#Remove information on area, distance and name
Aldabra_Group[[1]] <- list(island_age = Aldabra_Group[[1]]$island_age,
                           not_present = Aldabra_Group[[1]]$not_present)

# save data set
save(Aldabra_Group, file = "Aldabra_Group.RData")

### Azores ###

#Remove information on area, distance and name
Azores[[1]] <- list(island_age = Azores[[1]]$island_age,
                    not_present = Azores[[1]]$not_present)

# save data set
save(Azores, file = "Azores.RData")

### Canaries ###

#Remove information on area, distance and name
Canaries[[1]] <- list(island_age = Canaries[[1]]$island_age,
                     not_present = Canaries[[1]]$not_present)

# save data set
save(Canaries, file = "Canaries.RData")

### Cape_Verde ###

#Remove information on area, distance and name
Cape_Verde[[1]] <- list(island_age = Cape_Verde[[1]]$island_age,
                        not_present = Cape_Verde[[1]]$not_present)

# save data set
save(Cape_Verde, file = "Cape_Verde.RData")

### Chatham ###

#Remove information on area, distance and name
Chatham[[1]] <- list(island_age = Chatham[[1]]$island_age,
                     not_present = Chatham[[1]]$not_present)

# save data set
save(Chatham, file = "Chatham.RData")

### Comoros ###

#Remove information on area, distance and name
Comoros[[1]] <- list(island_age = Comoros[[1]]$island_age,
                     not_present = Comoros[[1]]$not_present)

# save data set
save(Comoros, file = "Comoros.RData")

### Galapagos ###

#Remove information on area, distance and name
Galapagos[[1]] <- list(island_age = Galapagos[[1]]$island_age,
                       not_present = Galapagos[[1]]$not_present)

# save data set
save(Galapagos, file = "Galapagos.RData")

### Guadalupe ###

#Remove information on area, distance and name
Guadalupe[[1]] <- list(island_age = Guadalupe[[1]]$island_age,
                       not_present = Guadalupe[[1]]$not_present)

# save data set
save(Guadalupe, file = "Guadalupe.RData")

### Hawaii ###

#Remove information on area, distance and name
Hawaii[[1]] <- list(island_age = Hawaii[[1]]$island_age,
                   not_present = Hawaii[[1]]$not_present)

# save data set
save(Hawaii, file = "Hawaii.RData")

### Juan Fernandez ###

#Remove informaton on area, distance and name
Juan_Fernandez[[1]] <- list(island_age = Juan_Fernandez[[1]]$island_age,
                            not_present = Juan_Fernandez[[1]]$not_present)

# save data set
save(Juan_Fernandez, file = "Juan_Fernandez.RData")

### Lord Howe ###

#Remove information on area, distance and name
Lord_Howe[[1]] <- list(island_age = Lord_Howe[[1]]$island_age,
                       not_present = Lord_Howe[[1]]$not_present)

# save data set
save(Lord_Howe, file = "Lord_Howe.RData")

### Madeira ###

#Remove information on area, distance and name
Madeira[[1]] <- list(island_age = Madeira[[1]]$island_age,
                     not_present = Madeira[[1]]$not_present)

# save data set
save(Madeira, file = "Madeira.RData")

### Guam_Marianas ###

#Remove information on area, distance and name
Guam_Marianas[[1]] <- list(island_age = Guam_Marianas[[1]]$island_age,
                           not_present = Guam_Marianas[[1]]$not_present)

# save data set
save (Guam_Marianas, file = "Guam_Marianas.RData")

### Marquesas ###

#Remove information on area, distance and name
Marquesas[[1]] <- list(island_age = Marquesas[[1]]$island_age,
                       not_present = Marquesas[[1]]$not_present)

# save data set
save(Marquesas, file = "Marquesas.RData")

### Mauritius Island ###

#Remove information on area, distance and name
Mauritius_Island[[1]] <- list(island_age = Mauritius_Island[[1]]$island_age,
                              not_present = Mauritius_Island[[1]]$not_present)

# save data set
save(Mauritius_Island, file = "Mauritius_Island.RData")

### New_Caledonia ###

#Remove information on area, distance and name
New_Caledonia[[1]] <- list(island_age = New_Caledonia[[1]]$island_age,
                           not_present = New_Caledonia[[1]]$not_present)

# save data set
save(New_Caledonia, file = "New_Caledonia.RData")

### Niue ###

#Remove information on area, distance and name
Niue[[1]] <- list(island_age = Niue[[1]]$island_age,
                  not_present = Niue[[1]]$not_present)

# save data set
save(Niue, file = "Niue.RData")

### Norfolk ###

#Remove information on area, distance and name
Norfolk[[1]] <- list(island_age = Norfolk[[1]]$island_age,
                     not_present = Norfolk[[1]]$not_present)

# save data set
save(Norfolk, file = "Norfolk.RData")

### Ogasawara ###

#Remove information on area, distance and name
Ogasawara[[1]] <- list(island_age = Ogasawara[[1]]$island_age,
                       not_present = Ogasawara[[1]]$not_present)

# save data set
save(Ogasawara, file = "Ogasawara.RData")

### Palau ###

#Remove information on area, distance and name
Palau[[1]] <- list(island_age = Palau[[1]]$island_age,
                   not_present = Palau[[1]]$not_present)

# save data set
save(Palau, file = "Palau.RData")

### Reunion ###

#Remove information on area, distance and name
Reunion[[1]] <- list(island_age = Reunion[[1]]$island_age,
                     not_present = Reunion[[1]]$not_present)

# save data set
save(Reunion, file = "Reunion.RData")

### Samoa ###

#Remove information on area, distance and name
Samoa[[1]] <- list(island_age = Samoa[[1]]$island_age,
                   not_present = Samoa[[1]]$not_present)

# save data set
save(Samoa, file = "Samoa.RData")

### SaoTome_Principe ###

#Remove information on area, distance and name
SaoTome_Principe[[1]] <- list(island_age = SaoTome_Principe[[1]]$island_age,
                              not_present = SaoTome_Principe[[1]]$not_present)

# save data set
save(SaoTome_Principe, file = "SaoTome_Principe.RData")

### Seychelles_Inner ###

#Remove information on area, distance and name
Seychelles_Inner[[1]] <- list(island_age = Seychelles_Inner[[1]]$island_age,
                              not_present = Seychelles_Inner[[1]]$not_present)

# save data set
save(Seychelles_Inner, file = "Seychelles_Inner.RData")

### Socorro ###

#Remove information on area, distance and name
Socorro[[1]] <- list(island_age = Socorro[[1]]$island_age,
                     not_present = Socorro[[1]]$not_present)

# save data set
save(Socorro, file = "Socorro.RData")
