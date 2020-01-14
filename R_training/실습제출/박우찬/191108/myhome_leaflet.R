# Q.1


mk <- geocode(enc2utf8('망포역'), source = 'google')
lan <- mk$lon
lat <- mk$lat
msg <- '<strong>우리집</a></strong><hr>집근처 망포역'
map <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 16) %>% 
  addTiles() %>% addCircles(lng = lan, lat = lat, color='red', popup = msg )
map

install.packages("htmlwidgets")
library(htmlwidgets)
saveWidget(map, file="mymap.html")

