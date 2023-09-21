#' Load taxonomic groups
#'
#' @param my_data a data frame that includes a column with english estandar names
#' @param col_name the name of the column
#'
#' @return taxonomic groups to classify species
#' @export
#'
#' @examples classify_taxonomic(my_data=data.frame(Species=c('Black-throated Diver')),col_name = "Species")
classify_taxonomic<-function(my_data=my_data, col_name=col_name){

  my_data$species_name<-my_data[[col_name]]

  Divers<-c("Black-throated Diver","Great Northern Diver","Red-throated Diver","unidentified diver")

  #Combine cormorants and gannets
  Cormorant_Gannets<-c("Great Cormorant","Great Cormorant/European Shag","Northern Gannet","Great Cormorant / European Shag")

  Anatidae<-c("Common Eider","Common Scoter","Eurasian Teal","Long-tailed Duck","Red-breasted Merganser","Eurasian Wigeon","Northern Shoveler","Velvet Scoter","unidentified duck","Mallard","Goosander","Common Pochard")

  #Please move Mute Swan and Cmmon Shelduck to separate classification
  Geese_Shelducks<-c("Brent Goose","Greylag Goose","Barnacle Goose","Canada Goose","Mute Swan","Common Shelduck")

  Skuas<-c("Arctic Skua","Great Skua","Long-tailed Skua","Pomarine skua")

  Auks<-c("Atlantic Puffin","Common Guillemot","Common Guillemot/Razorbill", "Common Guillemot / Razorbill", "Razorbill","unidentified auk")

  Grebes<-c("Great Crested Grebe","unidentified grebe","Black-necked Grebe","Red-necked Grebe")

  Waders<-c("Common Greenshank","Grey Plover","Eurasian Oystercatcher","European Golden Plover","Red Knot","unidentified wader","Whimbrel","Eurasian Curlew","Bar-tailed Godwit","Dunlin","Avocet","Northern Lapwing")

  Gulls<-c("fulmar / gull","Great Black-backed Gull / Lesser Black-backed Gull","Black-headed Gull","Black-legged Kittiwake","Lesser Black-backed Gull","Little Gull","Small gull species","tern/small gull","unidentified gull","unidentified large gull","unidentified small gull","Common Gull" ,"Great / Lesser Black-backed Gull","Herring Gull","Great Black-backed Gull","fulmar/gull","Fulmar / gull species","fulmar/gull","Little Gull","Great / Lesser Black-backed Gull","tern/small gull")

  Terns<-c("Sandwich Tern","Common/Arctic Tern","unidentified tern","Tern / small gull","Common Tern / Arctic Tern","Common Tern","Little Tern")

  OtherBirds<-c("Northern Fulmar","Common Kestrel","Eurasian Sparrowhawk","Grey Heron","unidentified songbird","unidentified bird","Eurasian Marsh Harrier","Common Wood Pigeon","Common Coot","Feral Pigeon","Great Egret")

  Mammals <- c("unidentified whale","unidentified pinniped (Grey Seal / Harbour Seal)","Grey Seal", "Harbour Porpoise" ,"Harbour Seal","Minke Whale","unidentified marine mammal","unidentified pinniped (Grey/Harbour Seal)","White-beaked Dolphin","White-sided Dolphin","Bottlenose Dolphin", "Common Dolphin","Risso's Dolphin","Killer Whale")

  my_data$tax_class<-ifelse(my_data$species_name %in% Divers, "Divers",
                            ifelse(my_data$species_name %in% Cormorant_Gannets, "Cormorant_Gannets",
                                   ifelse(my_data$species_name %in% Anatidae, "Anatidae",
                                          ifelse(my_data$species_name %in% Geese_Shelducks, "Geese_Shelducks",
                                                 ifelse(my_data$species_name %in% Skuas, "Skuas",
                                                        ifelse(my_data$species_name %in% Auks, "Auks",
                                                               ifelse(my_data$species_name %in% Grebes, "Grebes",
                                                                      ifelse(my_data$species_name %in% Waders, "Waders",
                                                                             ifelse(my_data$species_name %in% Gulls, "Gulls",
                                                                                    ifelse(my_data$species_name %in% Terns, "Terns",
                                                                                           ifelse(my_data$species_name %in% OtherBirds, "OtherBirds",
                                                                                                  ifelse(my_data$species_name %in% Mammals, "Mammals","Not included yet"))))))))))))

  return(my_data)
}
