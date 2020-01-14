lib=read.csv("지역별장애인도서관정보.csv")
seoul <- geocode("seoul", source = "google")
cen <- c(seoul$lon, seoul$lat)
data.frame() lib$도서관명
lib_LL <- data.frame(name=lib$도서관명,lon=lib$LON, lat=lib$LAT);lib_LL
map <- get_googlemap(center=cen, maptype="roadmap",zoom=11)
ggmap(map) + 
  geom_point(data = lib_LL, aes(x = lon, y = lat), colour = 'red',size = 2, alpha=0.7)+
  geom_text(data = lib_LL, aes(x = lon, y = lat, label=name), vjust=0, hjust=0)