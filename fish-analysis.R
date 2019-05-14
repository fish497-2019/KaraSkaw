fish_data <-  read.csv("Gaeta_etal_CLC_data.csv")
#Creating a new categorical size column
library(dplyr)
fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))
#Removing fish with scale length less then 1mm
select(fish_data_cat, scalelength) %>%
  filter(scalelength > 1)
