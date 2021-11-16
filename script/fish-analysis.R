

fish_data <- read.csv("data/Gaeta_etal_CLC_data.csv") 

library(dplyr)


# adding column to denote if the fish is big or small using 300 as cutoff

fish_data_cat <- fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))



