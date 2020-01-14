home <- geocode(enc2utf8("경기도 역북동 275"), source = "google")
lan <- home$lon
lat <- home$lat
msg <- '<strong>신부근의 집</strong><hr>신부근이 살고있는곳'
map <- leaflet() %>% setView(lng = home$lon, lat = home$lat, zoom = 16) %>% addTiles() %>% 
  addCircles(lng = home$lon, lat = home$lat, color='deeppink', popup = msg )
map

install.packages("htmlwidgets")
library(htmlwidgets)
saveWidget(map, file="mymap.html")
