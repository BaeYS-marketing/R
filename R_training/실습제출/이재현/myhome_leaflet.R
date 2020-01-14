install.packages("htmlwidgets")
library(htmlwidgets)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

seoul_lonlat <- geocode("GOyang")
myhome <- geocode(enc2utf8('경기도 고양시 백양로 8&language=ko'),source = 'google', output = 'latlona')
leaflet()

leaflet() %>% addTiles() 


myhome <- myhomelonlat
lan <- myhome$lon
lat <- myhome$lat
msg <- '<strong>이재현의 집</a></strong><hr>3인가족거주중'
map2 <- leaflet() %>% setView(lng = myhome$lon, lat = myhome$lat, zoom = 16) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='purple', popup = msg )
map2


saveWidget(map2, file="mymap.html")