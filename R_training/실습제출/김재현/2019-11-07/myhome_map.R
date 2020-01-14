library(dplyr)
library(ggmap)
library(ggplot2)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')


# 지도 출력 실습(1)
mk <- geocode("서울시 송파구 양산로8길 24", source = 'google')
cen <- c(mk$lon, mk$lat)

t <- Sys.time()
sec <- format(t, "%S")
M_type <- NULL
if(as.numeric(sec) >= 45){
  M_type <- ("hybrid")
}else if(as.numeric(sec) >= 30){
  M_type <- ("roadmap")
}else if(as.numeric(sec) >= 15){
  M_type <- ("satellite")
}else{
  M_type <- ("terrain")
}

map <- get_googlemap(center = cen, maptype = M_type, zoom=14, markers = mk)
ggmap(map)+labs(title = "김재현의 집", x="경도", y="위도") +
geom_text(aes(x=mk$lon, y=mk$lat, label="김재현의 집", vjust=0, hjust=0)) +
ggsave("mymap.png")
