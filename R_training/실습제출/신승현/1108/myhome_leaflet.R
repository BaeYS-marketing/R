library(ggmap)

names <- c("승현집")
addr <- c("서울특별시 둘레 15길 7")
gc <- geocode(enc2utf8(addr))

content1 <- paste(sep = '<br/>',"<b>승현집</b>",'여기')

map<-leaflet() %>% addTiles() %>%
  addCircles(lng = gc$lon, lat = gc$lat, color='purple', popup = content1)
map

# install.packages("htmlwidgets")
library(htmlwidgets)

saveWidget(map, file="mymap.html")


