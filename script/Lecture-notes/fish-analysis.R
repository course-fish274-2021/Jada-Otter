

fish_data <- read.csv("data/Gaeta_etal_CLC_data_1.csv") 

library(dplyr)


# adding column to denote if the fish is big or small using 300 as cutoff

fish_data_cat <- fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))


# removing scalelengths that are less than 1 mm 

fish_data_cat <- fish_data %>%
  filter(scalelength > 1) %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))


library(ggplot2)

#plotting a histogram by fish size

ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram(bins = 80)


ggsave("scale_hist_by_length.jpg")




