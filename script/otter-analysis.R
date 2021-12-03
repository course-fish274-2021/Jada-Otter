


library(dplyr)
library(ggplot2)

otter_data <- read.csv("data/Bowden-ParryOtterdata.csv")
head(otter_data)

#gather new information (answers to questions) regarding your dataset.
#What food do the otters prefer more; trout, mussels, or crab?
#using the columns of data, foodtype, totalbeg and begreceived.
#I need begreceived to be > 0 to exclude trials that did not receive food when they wanted it. 
# I also made the totalbeg > 0 so I could see if the otters wanted that food or not. 

begging <-   
  otter_data %>%
  filter(begreceived > 0, totalbeg > 0) %>% 
  select(foodtype, totalbeg, begreceived)

## Plotting begged v recieved foods

ggplot(begging, aes(x = begreceived, y = totalbeg)) +
  geom_point(size = 3, alpha = 0.5) +
  facet_wrap(~foodtype)


# Analysis 2

sharing <- 
  otter_data %>% 
  filter(begreceived > 0, sharingbybegonly > 0) %>% 
  select(begreceived, sharingbybegonly, foodtype)


# plotting if the food was recieved

ggplot(sharing, aes(x = begreceived, y = sharingbybegonly)) +
  geom_point(size = 3, alpha = 0.5) +
  facet_wrap(~foodtype)






