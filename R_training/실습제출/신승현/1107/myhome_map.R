#문제1
names <- c("우리집")
addr <- c("서울특별시 둘레 15길 7")
gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name=names,
                 lon=gc$lon,
                 lat=gc$lat)
cen <- c(mean(df$lon),mean(df$lat))


sec = as.POSIXlt(Sys.time())$sec

map = if(sec>0 & sec<14){
  map <- get_googlemap(center=cen, maptype="terrain", marker=mk)
  ggmap(map)
}else if(sec>15 & sec<29){
  map <- get_googlemap(center=cen, maptype="satellite", marker=mk)
}else if(sec>30 & sec<44){
  map <- get_googlemap(center=cen, maptype="roadmap", marker=mk)
}else if(sec>45 & sec<59){
  map <-get_googlemap(center=cen, maptype="hybrid", marker=mk)
}

map <- get_googlemap(center=cen, maptype="hybrid",zoom=14, marker=mk)
ggmap(map)+labs(title="신승현의 집", x="경도", y="위도")


map <- get_googlemap(center=cen,
                     maptype="roadmap",
                     zoom=10,
                     size=c(640,640),
                     marker=gc)

ggmap(map) 

ggsave("mymap.png")


