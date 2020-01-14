install.packages("htmlwidgets")
library(htmlwidgets)
library(ggplot2)
library(dplyr)
library(leaflet)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')


# 문제 1

home_lonlat <- geocode("서울시 송파구 양산로8길 24")
lon1 <- home_lonlat$lon
lat1 <- home_lonlat$lat

msg <- "<bold>207동</bold><hr>우리집"
map_set <- leaflet() %>%
  setView(lng = home_lonlat$lon, lat = home_lonlat$lat, zoom = 16) %>%
  addTiles() %>% 
  addCircles(lng = lon1, lat = lat1, color = "green", popup = msg)
map_set

saveWidget(map_set, "mymap.html")
