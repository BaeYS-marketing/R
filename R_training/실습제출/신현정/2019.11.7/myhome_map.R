#문제 1

library(ggmap)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

time<-Sys.time()
t <- format(time, "%S")
print(t)
type <- ifelse(t<15, "terrain", ifelse(t<30, "satellite", ifelse(t<45,"roadmap","hybrid")))
home <- geocode(enc2utf8("동작구 사당로 16다길"),  source = "google")

cen <-c(home$lon , home$lat)
mk <- data.frame(lon=home$lon, lat=home$lat)
map <-get_googlemap(center = cen,  maptype= type, marker=mk)

ggmap(map)+
  geom_text(aes(x=mk$lon, y=mk$lat, label="신현정의 집")) +labs(title="신현정의 집", x="위도", y="경도")


ggsave("mymap.png")
