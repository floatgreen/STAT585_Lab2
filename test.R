library(ggplot2)
library(sf)


setwd("/home/ying/Desktop/STAT_Spring_2019/STAT585/STAT585_Lab2")
p <- ggplot() +
  geom_sf(data = read_sf("data/ME-GIS/Coastline2.shp"), 
          colour="grey10", fill="grey90") +
  geom_sf(data = read_sf("data/ME-GIS/Rivers19.shp"), 
          colour="steelblue", size=0.3) +
  geom_sf(data = read_sf("data/ME-GIS/PrimaryRoads.shp"), 
          size = 0.7, colour="grey30") +
  geom_sf(data = read_sf("data/ME-GIS/Cities.shp")) +
  theme_bw()



city = read_sf("data/ME-GIS/Cities.shp")

# lable cities 


# ?geom_sf_text


p <- p + geom_sf_text(data = read_sf("data/ME-GIS/Cities.shp") ,    aes(label = Name))


library(ggspatial)


p <- p + annotation_scale(location = "bl")

p + annotation_north_arrow(which_north = "true", location = "tl")

# 

#library(ggplot2)
library(maps)
states <- map_data("state")
head(states)
library(dplyr)
michigan <- states %>% 
  filter(region=="michigan") %>%
  group_by(group) %>% 
  summarize(
    region = region[1],
    n = n())
michigan

#https://gadm.org/


ggplot(states, aes(x=long, y=lat, group=group)) + geom_polygon()
