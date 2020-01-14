mk <- geocode(enc2utf8("경기도 성남시 분당구 정자동"), source = "google")
msg <- '<strong>우리동네</strong><hr>우리집'
map <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 16) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color = 'magenta', popup = msg)
map

install.packages("htmlwidgets")
library(htmlwidgets)
saveWidget(map, file="mymap.html")
