
# 문제1
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
lon <- 126.803238 #경도
lat <- 37.673896 #위도
cen <- c(lon,lat)
home <- data.frame(lon=lon, lat=lat)
mk <- data.frame(lon=lon, lat=lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=15, marker=mk)
# marker는 반드시 데이터프레임이어야 한다
# 가끔 같이 수행하면 테스트 안 될 때도 있고 늦으니 Run은 적당히 나눠서.
now <- Sys.time()
nowsecond<-as.numeric(format(now, "%S"))

if(as.numeric(format(Sys.time(),"%S")) >= 45){
  ggmap(get_googlemap(center=cen, maptype="hybrid",zoom=15, marker=mk)) +
    labs(title="한세희의 집", x="경도", y="위도")+
    geom_text(aes(x=mk$lon, y=mk$lat, label="한세희의 집", vjust=0, hjust=0))
} else if(as.numeric(format(Sys.time(),"%S")) >= 30){
  ggmap(get_googlemap(center=cen, maptype="roadmap",zoom=15, marker=mk)) +
    labs(title="한세희의 집", x="경도", y="위도") +
    geom_text(aes(x=mk$lon, y=mk$lat, label="한세희의 집", vjust=0, hjust=0))
} else if(as.numeric(format(Sys.time(),"%S")) >= 15){
  ggmap(get_googlemap(center=cen, maptype="satellite",zoom=15, marker=mk)) +
    labs(title="한세희의 집", x="경도", y="위도")+
    geom_text(aes(x=mk$lon, y=mk$lat, label="한세희의 집", vjust=0, hjust=0))
} else{
  ggmap(get_googlemap(center=cen, maptype="terrain",zoom=15, marker=mk)) +
    labs(title="한세희의 집", x="경도", y="위도")+
    geom_text(aes(x=mk$lon, y=mk$lat, label="한세희의 집", vjust=0, hjust=0))
}

ggsave("mymap.png")


# 문제2
mk <- geocode(enc2utf8("서울"), source = "google")
cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=mk)
ggmap(map)


library <- read.csv("data/지역별장애인도서관정보.csv")
df <- data.frame(library$도서관명, library$LON, library$LAT)
mk <- data.frame(library$LON, library$LAT)
cen <- c(mean(df$library.LON),mean(df$library.LAT))
map <- get_googlemap(center=cen, maptype="roadmap",zoom=11, marker=mk)
ggmap(map)+geom_point(data=df, aes(x=library$LON, y=library$LAT), alpha=0.5, size=3, color="red")
