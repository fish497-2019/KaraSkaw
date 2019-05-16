#Create an object called fish_data for the raw data

fish_data <-  read.csv("C:/Users/skawk/OneDrive/Documents/Git_Hub/KaraSkaw/Gaeta_etal_CLC_data_1.csv.csv")
#Creating a new categorical size column
library(dplyr)
fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small"))

#Removing fish with scale length less then 1mm
select(fish_data_cat, scalelength) %>%
  filter(scalelength > 1)

#load ggplot2
library(ggplot2)
#Create a map with length on the x axis and scale length on the y axis
#Color the plots by lakeid
#Add descriptive labels
ggplot(data = fish_data_cat)+
  geom_point(mapping = aes(x=length, y=scalelength, color = lakeid))+
  labs(x = "Length of fish's body", y = "Scale length")

#Pulling code from GitHub
ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram()

#Modify code & set the bins argument to 80
ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram(bins=80)

#Saving plot
ggsave("scale_hist_by_length.jpg")
