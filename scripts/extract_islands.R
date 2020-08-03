library(DAISIE)
data(archipelagos41)

#Remove all archipelagos that do not have any species
archipelagos <- archipelagos41[grep("branching_times", archipelagos41)]

#Split archipelagos into separate lists
for (i in seq_along(archipelagos)) {
  assign(paste(archipelagos[[i]][[1]]$name), archipelagos[[i]])
}

### Aldabra_Group ###

#Remove information on area, distance and name
Aldabra_Group[[1]] <- list(island_age = Aldabra_Group[[1]]$island_age,
                           not_present = Aldabra_Group[[1]]$not_present)

#Calculate number of species
brts <- sapply(Aldabra_Group, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Aldabra_Group[[1]]$not_present)]
brts <- brts[-which(brts == Aldabra_Group[[1]]$island_age)]
stac <- sapply(Aldabra_Group, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Aldabra_Group, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Aldabra_Group, file = "Aldabra_Group.RData")
}

### Azores ###

#Remove information on area, distance and name
Azores[[1]] <- list(island_age = Azores[[1]]$island_age,
                    not_present = Azores[[1]]$not_present)

#Calculate number of species
brts <- sapply(Azores, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Azores[[1]]$not_present)]
brts <- brts[-which(brts == Azores[[1]]$island_age)]
stac <- sapply(Azores, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Azores, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Azores, file = "Azores.RData")
}

### Bermuda ###

#Remove information on area, distance and name
Bermuda[[1]] <- list(island_age = Bermuda[[1]]$island_age,
                     not_present = Bermuda[[1]]$not_present)

#Calculate number of species
brts <- sapply(Bermuda, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Bermuda[[1]]$not_present)]
brts <- brts[-which(brts == Bermuda[[1]]$island_age)]
stac <- sapply(Bermuda, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Bermuda, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Bermuda, file = "Bermuda.RData")
}

### Canaries ###

#Remove information on area, distance and name
Canaries[[1]] <- list(island_age = Canaries[[1]]$island_age,
                     not_present = Canaries[[1]]$not_present)

#Calculate number of species
brts <- sapply(Canaries, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Canaries[[1]]$not_present)]
brts <- brts[-which(brts == Canaries[[1]]$island_age)]
stac <- sapply(Canaries, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Canaries, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Canaries, file = "Canaries.RData")
}

### Cape_Verde ###

#Remove information on area, distance and name
Cape_Verde[[1]] <- list(island_age = Cape_Verde[[1]]$island_age,
                        not_present = Cape_Verde[[1]]$not_present)

#Calculate number of species
brts <- sapply(Cape_Verde, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Cape_Verde[[1]]$not_present)]
brts <- brts[-which(brts == Cape_Verde[[1]]$island_age)]
stac <- sapply(Cape_Verde, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Cape_Verde, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Cape_Verde, file = "Cape_Verde.RData")
}

### Chatham ###

#Remove information on area, distance and name
Chatham[[1]] <- list(island_age = Chatham[[1]]$island_age,
                     not_present = Chatham[[1]]$not_present)

#Calculate number of species
brts <- sapply(Chatham, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Chatham[[1]]$not_present)]
brts <- brts[-which(brts == Chatham[[1]]$island_age)]
stac <- sapply(Chatham, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Chatham, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Chatham, file = "Chatham.RData")
}

### Christmas_Island ###

#Remove information on area, distance and name
Christmas_Island[[1]] <- list(island_age = Christmas_Island[[1]]$island_age,
                     not_present = Christmas_Island[[1]]$not_present)

#Calculate number of species
brts <- sapply(Christmas_Island, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Christmas_Island[[1]]$not_present)]
brts <- brts[-which(brts == Christmas_Island[[1]]$island_age)]
stac <- sapply(Christmas_Island, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Christmas_Island, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Christmas_Island, file = "Christmas_Island.RData")
}

### Cocos ###

#Remove information on area, distance and name
Cocos[[1]] <- list(island_age = Cocos[[1]]$island_age,
                   not_present = Cocos[[1]]$not_present)

#Calculate number of species
brts <- sapply(Cocos, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Cocos[[1]]$not_present)]
brts <- brts[-which(brts == Cocos[[1]]$island_age)]
stac <- sapply(Cocos, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Cocos, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Cocos, file = "Cocos.RData")
}

### Comoros ###

#Remove information on area, distance and name
Comoros[[1]] <- list(island_age = Comoros[[1]]$island_age,
                     not_present = Comoros[[1]]$not_present)

#Calculate number of species
brts <- sapply(Comoros, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Comoros[[1]]$not_present)]
brts <- brts[-which(brts == Comoros[[1]]$island_age)]
stac <- sapply(Comoros, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Comoros, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Comoros, file = "Comoros.RData")
}

### Fernando_Noronha ###

#Remove information on area, distance and name
Fernando_Noronha[[1]] <- list(island_age = Fernando_Noronha[[1]]$island_age,
                              not_present = Fernando_Noronha[[1]]$not_present)

#Calculate number of species
brts <- sapply(Fernando_Noronha, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Fernando_Noronha[[1]]$not_present)]
brts <- brts[-which(brts == Fernando_Noronha[[1]]$island_age)]
stac <- sapply(Fernando_Noronha, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Fernando_Noronha, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Fernando_Noronha, file = "Fernando_Noronha.RData")
}

### Galapagos ###

#Remove information on area, distance and name
Galapagos[[1]] <- list(island_age = Galapagos[[1]]$island_age,
                       not_present = Galapagos[[1]]$not_present)

#Calculate number of species
brts <- sapply(Galapagos, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Galapagos[[1]]$not_present)]
brts <- brts[-which(brts == Galapagos[[1]]$island_age)]
stac <- sapply(Galapagos, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Galapagos, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Galapagos, file = "Galapagos.RData")
}

### Gough ###

#Remove information on area, distance and name
Gough[[1]] <- list(island_age = Gough[[1]]$island_age,
                   not_present = Gough[[1]]$not_present)

#Calculate number of species
brts <- sapply(Gough, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Gough[[1]]$not_present)]
brts <- brts[-which(brts == Gough[[1]]$island_age)]
stac <- sapply(Gough, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Gough, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Gough, file = "Gough.RData")
}

### Guadalupe ###

#Remove information on area, distance and name
Guadalupe[[1]] <- list(island_age = Guadalupe[[1]]$island_age,
                       not_present = Guadalupe[[1]]$not_present)

#Calculate number of species
brts <- sapply(Guadalupe, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Guadalupe[[1]]$not_present)]
brts <- brts[-which(brts == Guadalupe[[1]]$island_age)]
stac <- sapply(Guadalupe, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac== 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Guadalupe, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Guadalupe, file = "Guadalupe.RData")
}

### Guam_Marianas ###

#Remove information on area, distance and name
Guam_Marianas[[1]] <- list(island_age = Guam_Marianas[[1]]$island_age,
                           not_present = Guam_Marianas[[1]]$not_present)

#Calculate number of species
brts <- sapply(Guam_Marianas, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Guam_Marianas[[1]]$not_present)]
brts <- brts[-which(brts == Guam_Marianas[[1]]$island_age)]
stac <- sapply(Guam_Marianas, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Guam_Marianas, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Guam_Marianas, file = "Guam_Marianas.RData")
}

### Hawaii ###

#Remove information on area, distance and name
Hawaii[[1]] <- list(island_age = Hawaii[[1]]$island_age,
                   not_present = Hawaii[[1]]$not_present)

#Calculate number of species
brts <- sapply(Hawaii, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Hawaii[[1]]$not_present)]
brts <- brts[-which(brts == Hawaii[[1]]$island_age)]
stac <- sapply(Hawaii, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Hawaii, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Hawaii, file = "Hawaii.RData")
}

### Juan_Fernandez ###

#Remove information on area, distance and name
Juan_Fernandez[[1]] <- list(island_age = Juan_Fernandez[[1]]$island_age,
                            not_present = Juan_Fernandez[[1]]$not_present)

#Calculate number of species
brts <- sapply(Juan_Fernandez, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Juan_Fernandez[[1]]$not_present)]
brts <- brts[-which(brts == Juan_Fernandez[[1]]$island_age)]
stac<- sapply(Juan_Fernandez, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Juan_Fernandez, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Juan_Fernandez, file = "Juan_Fernandez.RData")
}

### Lord_Howe ###

#Remove information on area, distance and name
Lord_Howe[[1]] <- list(island_age = Lord_Howe[[1]]$island_age,
                       not_present = Lord_Howe[[1]]$not_present)

#Calculate number of species
brts <- sapply(Lord_Howe, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Lord_Howe[[1]]$not_present)]
brts <- brts[-which(brts == Lord_Howe[[1]]$island_age)]
stac <- sapply(Lord_Howe, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Lord_Howe, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Lord_Howe, file = "Lord_Howe.RData")
}

### Madeira ###

#Remove information on area, distance and name
Madeira[[1]] <- list(island_age = Madeira[[1]]$island_age,
                     not_present = Madeira[[1]]$not_present)

#Calculate number of species
brts <- sapply(Madeira, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Madeira[[1]]$not_present)]
brts <- brts[-which(brts == Madeira[[1]]$island_age)]
stac <- sapply(Madeira, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Madeira, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Madeira, file = "Madeira.RData")
}

### Marquesas ###

#Remove information on area, distance and name
Marquesas[[1]] <- list(island_age = Marquesas[[1]]$island_age,
                       not_present = Marquesas[[1]]$not_present)

#Calculate number of species
brts <- sapply(Marquesas, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Marquesas[[1]]$not_present)]
brts <- brts[-which(brts == Marquesas[[1]]$island_age)]
stac <- sapply(Marquesas, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Marquesas, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Marquesas, file = "Marquesas.RData")
}

### Mauritius_Island ###

#Remove information on area, distance and name
Mauritius_Island[[1]] <- list(island_age = Mauritius_Island[[1]]$island_age,
                              not_present = Mauritius_Island[[1]]$not_present)

#Calculate number of species
brts <- sapply(Mauritius_Island, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Mauritius_Island[[1]]$not_present)]
brts <- brts[-which(brts == Mauritius_Island[[1]]$island_age)]
stac <- sapply(Mauritius_Island, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Mauritius_Island, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Mauritius_Island, file = "Mauritius_Island.RData")
}

### New_Caledonia ###

#Remove information on area, distance and name
New_Caledonia[[1]] <- list(island_age = New_Caledonia[[1]]$island_age,
                           not_present = New_Caledonia[[1]]$not_present)

#Calculate number of species
brts <- sapply(New_Caledonia, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == New_Caledonia[[1]]$not_present)]
brts <- brts[-which(brts == New_Caledonia[[1]]$island_age)]
stac <- sapply(New_Caledonia, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(New_Caledonia, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(New_Caledonia, file = "New_Caledonia.RData")
}

### Niue ###

#Remove information on area, distance and name
Niue[[1]] <- list(island_age = Niue[[1]]$island_age,
                  not_present = Niue[[1]]$not_present)

#Calculate number of species
brts <- sapply(Niue, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Niue[[1]]$not_present)]
brts <- brts[-which(brts == Niue[[1]]$island_age)]
stac <- sapply(Niue, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Niue, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Niue, file = "Niue.RData")
}

### Norfolk ###

#Remove information on area, distance and name
Norfolk[[1]] <- list(island_age = Norfolk[[1]]$island_age,
                     not_present = Norfolk[[1]]$not_present)

#Calculate number of species
brts <- sapply(Norfolk, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Norfolk[[1]]$not_present)]
brts <- brts[-which(brts == Norfolk[[1]]$island_age)]
stac <- sapply(Norfolk, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Norfolk, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Norfolk, file = "Norfolk.RData")
}

### Ogasawara ###

#Remove information on area, distance and name
Ogasawara[[1]] <- list(island_age = Ogasawara[[1]]$island_age,
                       not_present = Ogasawara[[1]]$not_present)

#Calculate number of species
brts <- sapply(Ogasawara, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Ogasawara[[1]]$not_present)]
brts <- brts[-which(brts == Ogasawara[[1]]$island_age)]
stac <- sapply(Ogasawara, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Ogasawara, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Ogasawara, file = "Ogasawara.RData")
}

### Palau ###

#Remove information on area, distance and name
Palau[[1]] <- list(island_age = Palau[[1]]$island_age,
                   not_present = Palau[[1]]$not_present)

#Calculate number of species
brts <- sapply(Palau, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Palau[[1]]$not_present)]
brts <- brts[-which(brts == Palau[[1]]$island_age)]
stac <- sapply(Palau, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Palau, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Palau, file = "Palau.RData")
}

### Pitcairn ###

#Remove information on area, distance and name
Pitcairn[[1]] <- list(island_age = Pitcairn[[1]]$island_age,
                      not_present = Pitcairn[[1]]$not_present)

#Calculate number of species
brts <- sapply(Pitcairn, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Pitcairn[[1]]$not_present)]
brts <- brts[-which(brts == Pitcairn[[1]]$island_age)]
stac <- sapply(Pitcairn, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Pitcairn, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Pitcairn, file = "Pitcairn.RData")
}

### Rapa_Nui ###

#Remove information on area, distance and name
Rapa_Nui[[1]] <- list(island_age = Rapa_Nui[[1]]$island_age,
                      not_present = Rapa_Nui[[1]]$not_present)

#Calculate number of species
brts <- sapply(Rapa_Nui, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Rapa_Nui[[1]]$not_present)]
brts <- brts[-which(brts == Rapa_Nui[[1]]$island_age)]
stac <- sapply(Rapa_Nui, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Rapa_Nui, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Rapa_Nui, file = "Rapa_Nui.RData")
}

### Reunion ###

#Remove information on area, distance and name
Reunion[[1]] <- list(island_age = Reunion[[1]]$island_age,
                     not_present = Reunion[[1]]$not_present)

#Calculate number of species
brts <- sapply(Reunion, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Reunion[[1]]$not_present)]
brts <- brts[-which(brts == Reunion[[1]]$island_age)]
stac <- sapply(Reunion, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Reunion, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Reunion, file = "Reunion.RData")
}

### Rodrigues ###

#Remove information on area, distance and name
Rodrigues[[1]] <- list(island_age = Rodrigues[[1]]$island_age,
                       not_present = Rodrigues[[1]]$not_present)

#Calculate number of species
brts <- sapply(Rodrigues, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Rodrigues[[1]]$not_present)]
brts <- brts[-which(brts == Rodrigues[[1]]$island_age)]
stac <- sapply(Rodrigues, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Rodrigues, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Rodrigues, file = "Rodrigues.RData")
}

### Saint_Helena ###

#Remove information on area, distance and name
Saint_Helena[[1]] <- list(island_age = Saint_Helena[[1]]$island_age,
                          not_present = Saint_Helena[[1]]$not_present)

#Calculate number of species
brts <- sapply(Saint_Helena, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Saint_Helena[[1]]$not_present)]
brts <- brts[-which(brts == Saint_Helena[[1]]$island_age)]
stac <- sapply(Saint_Helena, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Saint_Helena, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Saint_Helena, file = "Saint_Helena.RData")
}

### Samoa ###

#Remove information on area, distance and name
Samoa[[1]] <- list(island_age = Samoa[[1]]$island_age,
                   not_present = Samoa[[1]]$not_present)

#Calculate number of species
brts <- sapply(Samoa, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Samoa[[1]]$not_present)]
brts <- brts[-which(brts == Samoa[[1]]$island_age)]
stac <- sapply(Samoa, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Samoa, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Samoa, file = "Samoa.RData")
}

### SaoTome_Principe ###

#Remove information on area, distance and name
SaoTome_Principe[[1]] <- list(island_age = SaoTome_Principe[[1]]$island_age,
                              not_present = SaoTome_Principe[[1]]$not_present)

#Calculate number of species
brts <- sapply(SaoTome_Principe, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == SaoTome_Principe[[1]]$not_present)]
brts <- brts[-which(brts == SaoTome_Principe[[1]]$island_age)]
stac <- sapply(SaoTome_Principe, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(SaoTome_Principe, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(SaoTome_Principe, file = "SaoTome_Principe.RData")
}

### Selvagens ###

#Remove information on area, distance and name
Selvagens[[1]] <- list(island_age = Selvagens[[1]]$island_age,
                       not_present = Selvagens[[1]]$not_present)

#Calculate number of species
brts <- sapply(Selvagens, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Selvagens[[1]]$not_present)]
brts <- brts[-which(brts == Selvagens[[1]]$island_age)]
stac <- sapply(Selvagens, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Selvagens, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Selvagens, file = "Selvagens.RData")
}

### Seychelles_Inner ###

#Remove information on area, distance and name
Seychelles_Inner[[1]] <- list(island_age = Seychelles_Inner[[1]]$island_age,
                              not_present = Seychelles_Inner[[1]]$not_present)

#Calculate number of species
brts <- sapply(Seychelles_Inner, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Seychelles_Inner[[1]]$not_present)]
brts <- brts[-which(brts == Seychelles_Inner[[1]]$island_age)]
stac <- sapply(Seychelles_Inner, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Seychelles_Inner, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Seychelles_Inner, file = "Seychelles_Inner.RData")
}

### Society ###

#Remove information on area, distance and name
Society[[1]] <- list(island_age = Society[[1]]$island_age,
                     not_present = Society[[1]]$not_present)

#Calculate number of species
brts <- sapply(Society, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Society[[1]]$not_present)]
brts <- brts[-which(brts == Society[[1]]$island_age)]
stac <- sapply(Society, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Society, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Society, file = "Society.RData")
}

### Socorro ###

#Remove information on area, distance and name
Socorro[[1]] <- list(island_age = Socorro[[1]]$island_age,
                   not_present = Socorro[[1]]$not_present)

#Calculate number of species
brts <- sapply(Socorro, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Socorro[[1]]$not_present)]
brts <- brts[-which(brts == Socorro[[1]]$island_age)]
stac <- sapply(Socorro, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Socorro, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Socorro, file = "Socorro.RData")
}

### Tonga ###

#Remove information on area, distance and name
Tonga[[1]] <- list(island_age = Tonga[[1]]$island_age,
                   not_present = Tonga[[1]]$not_present)

#Calculate number of species
brts <- sapply(Tonga, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Cocos[[1]]$not_present)]
brts <- brts[-which(brts == Cocos[[1]]$island_age)]
stac <- sapply(Tonga, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Tonga, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Tonga, file = "Tonga.RData")
}

### Tristan_da_Cunha ###

#Remove information on area, distance and name
Tristan_da_Cunha[[1]] <- list(island_age = Tristan_da_Cunha[[1]]$island_age,
                              not_present = Tristan_da_Cunha[[1]]$not_present)

#Calculate number of species
brts <- sapply(Tristan_da_Cunha, '[', 2)
brts <- unname(unlist(brts))
brts <- brts[-which(brts == Tristan_da_Cunha[[1]]$not_present)]
brts <- brts[-which(brts == Tristan_da_Cunha[[1]]$island_age)]
stac <- sapply(Tristan_da_Cunha, '[', 3)
stac <- unname(unlist(stac))
if (any(stac == 5)) {
  brts <- brts[-which(stac == 5)]
}
num_spec <- length(brts)

#Calculate number of missing species
miss_spec <- sapply(Tristan_da_Cunha, '[', 4)
miss_spec <- unname(unlist(miss_spec))
miss_spec <- sum(miss_spec, length(which(stac == 5)))

#Calculate total species on the archipelago
total_spec <- num_spec + miss_spec

#Check if archipelago has more than 10 species and more than 50% species
#coverage, if so save data set
if (num_spec >= 10 && miss_spec < total_spec / 2) {
  save(Tristan_da_Cunha, file = "Tristan_da_Cunha.RData")
}
