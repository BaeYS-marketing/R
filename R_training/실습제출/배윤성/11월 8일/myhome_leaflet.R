# install.packages("htmlwidgets")
library(ggmap)
library(ggplot2)
library(dplyr)
library(leaflet)
library(htmlwidgets)

register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

myHome <- geocode(enc2utf8('수원시 팔달구 경수대로 672'))

msg <- '<strong>배윤성 집</strong><hr>이사 안간다'

mapHome <- leaflet() %>% 
        setView(lng = myHome$lon, lat = myHome$lat, zoom=16) %>% 
        addTiles() %>% 
        addCircles(lng = myHome$lon, lat = myHome$lat, col = 'red',popup = msg)

getwd()
setwd('../..')
saveWidget(mapHome, file ='mymap.html')

