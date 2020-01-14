rm(list = ls())
library(Kormaps)
library(dplyr)
library(leaflet)
library(ggmap)
library(htmlwidgets)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
DONG<-read.csv('c:/RStudy/one.csv')

names(korpopmap3)
Encoding(names(korpopmap3)) <- "UTF-8"
names(korpopmap3)

Encoding(korpopmap3@data$name) <- "UTF-8"
Encoding(korpopmap3@data$name_eng) <- "UTF-8"
Encoding(korpopmap3@data$행정구역별_읍면동) <- "UTF-8"

korpopmap3@data<-korpopmap3@data[c(381:406),] 
korpopmap3@polygons<-korpopmap3@polygons[c(381:406)]

colnames(DONG)<-c('구별','name','일인가구')
DONG <- DONG %>% filter(구별 == "송파구")
DONG <- DONG %>% filter(name != "위례동")
korpopmap3@data<-merge(korpopmap3@data,DONG,by.x='name',sort=FALSE)
map <- korpopmap3@data
mypalette <- colorNumeric(palette ='RdYlBu' , domain = map$'일인가구')
mypopup <- paste0(map$name,'<br> 1인가구: ',map$'일인가구')

map7 <- NULL
map7<-leaflet(korpopmap3) %>% 
  addTiles() %>% 
  setView(lat=37.52711, lng=126.987517, zoom=12) %>%
  addPolygons(stroke =FALSE,
              smoothFactor = 0.2,
              fillOpacity = .9,
              popup = mypopup,
              color = ~mypalette(map$일인가구)) %>% 
  addLegend( values = ~map$일인가구,
             pal =mypalette ,
             title = '인구수',
             opacity = 1)
map7

saveWidget(map7, "oneMap.html")
