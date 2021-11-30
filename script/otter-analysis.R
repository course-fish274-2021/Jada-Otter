

otter_data <- read.csv("data/Bowden-ParryOtterdata.csv")

library(dplyr)
library(ggplot2)

#gather new information (answers to questions) regarding your dataset.
#What food do the otters prefer more; trout, mussels, or crab?
#using the columns of data, foodtype, totalbeg and begreceived.
#I need begreceived to be > 0 to exclude trials that did not receive food when they wanted it. 
# I also made the totalbeg > 0 so I could see if the otters wanted that food or not. 

otter_data %>%
  filter(begreceived > 0, totalbeg > 0) %>% 
  select(foodtype, totalbeg)

ggplot(otter_data) +
  geom_histogram(data = otter_data, aes(x = foodtype, alpha = 0.3))
  

  geom_histogram(data = otter_data, aes(x = crab, alpha = 0.3))+
  geom_histogram(data = otter_data, aes(x = mussel, alpha = 0.3))+
  facet_wrap(~foodtype)