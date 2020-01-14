
sytm <- Sys.time()
(tm <- strptime(sytm,"%Y-%m-%d %H:%M:%S"))

format(tm, "%S")

myhome <- geocode(enc2utf8("서울시 금천구 금하로 24길13"), source = "google")
mk <- myhome
cen <- c(mk$lon, mk$lat)

if(tm >= 0 & tm < 15 ){
map <- get_googlemap(center=cen, maptype="terrain",zoom=16)
ggmap(map) + 
  geom_point(aes(x=mk$lon, y=mk$lat), alpha=0.4, size=5, color="pink") +
  geom_text(aes(x=mk$lon, y=mk$lat, label="최승민 동네", vjust=0, hjust=0)) +
  labs(title="최승민동네", x="경도", y="위도")
} else if (tm >= 15 & tm <30) {
  map <- get_googlemap(center=cen, maptype="satellite",zoom=16)
  ggmap(map) + 
    geom_point(aes(x=mk$lon, y=mk$lat), alpha=0.4, size=5, color="pink") +
    geom_text(aes(x=mk$lon, y=mk$lat, label="최승민 동네", vjust=0, hjust=0)) +
    labs(title="최승민동네", x="경도", y="위도")
  
} else if ( tm >= 30 & tm < 45) {
  map <- get_googlemap(center=cen, maptype="roadmap",zoom=16)
  ggmap(map) + 
    geom_point(aes(x=mk$lon, y=mk$lat), alpha=0.4, size=5, color="pink") +
    geom_text(aes(x=mk$lon, y=mk$lat, label="최승민 동네", vjust=0, hjust=0)) +
    labs(title="최승민동네", x="경도", y="위도")
} else {
  map <- get_googlemap(center=cen, maptype="hybrid",zoom=16)
  ggmap(map) + 
    geom_point(aes(x=mk$lon, y=mk$lat), alpha=0.4, size=5, color="pink") +
    geom_text(aes(x=mk$lon, y=mk$lat, label="최승민 동네", vjust=0, hjust=0)) +
    labs(title="최승민동네", x="경도", y="위도")
}

ggsave("mymap.png")

