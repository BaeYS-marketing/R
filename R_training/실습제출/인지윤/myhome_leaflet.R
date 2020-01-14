register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

home <- geocode(enc2utf8("충청남도 당진시 원당동 1226"))
lan <- home$lon
lat <- home$lat

msg <- '인지윤의 집</a></strong><hr>인지윤(25)가 살고 있는 곳'
map <- leaflet() %>% setView(lng=home$lon, lat=home$lat, zoom = 16) %>% 
  addTiles() %>% addCircles(lng = lan, lat = lat, color='red', popup = msg )
map

install.packages("htmlwidgets")
library(htmlwidgets)
saveWidget(map, file="c:/Rstudy/mymap.html")
