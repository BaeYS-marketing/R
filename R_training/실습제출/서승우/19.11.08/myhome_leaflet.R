library(leaflet)
library(dplyr)
library(ggplot2)
library(ggmap)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

pu<-'<strong>우리집</strong><hr>우리집'
mh<-geocode(enc2utf8('경기도 하남시 덕풍남로 11'), source='google')
lan <- mh$lon
lat <- mh$lat
mh1 <- leaflet() %>% setView(lng = mh$lon, lat = mh$lat, zoom = 18) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='green', popup = pu )
