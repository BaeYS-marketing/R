install.packages("htmlwidgets")
library(htmlwidgets)
library(dplyr)
library(ggmap)
library(ggplot2)

register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

myhome <- geocode(enc2utf8("서울시 금천구 금하로 24길13"), source = "google")
mk <- myhome

msg <- '<strong><a href="http://www.multicampus.co.kr" style="text-decoration:none" >최승민의집</a></strong><hr>최승민이 사는곳'
map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 16) %>% addTiles() %>% addCircles(lng = mk$lon, lat = mk$lat, color='green', popup = msg)
map2
dev.off
