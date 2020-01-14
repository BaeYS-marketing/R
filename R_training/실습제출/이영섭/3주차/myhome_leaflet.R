library(leaflet)
library(dplyr)
library(ggmap)
library(ggplot2)

register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
location <- geocode("경기도 화성시 반송동 석우중학교")
lan <- location$lon
lat <- location$lat

msg <- '<strong>유니코의 집</strong><hr>백도(말티즈, 13살)가 살고 있는 곳'
map2 <- leaflet() %>% setView(lng =location$lon, lat =location$lat, zoom = 16) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='deeppink', popup = msg )
map2

# install.packages("htmlwidgets")
library(htmlwidgets)
saveWidget(map2, file="mymap.html")
