library(ggmap)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

geocode('GOyang', source = 'google')
today <- as.numeric(as.character(format(Sys.time(),"%S")))
myhome <- geocode(enc2utf8('경기도 고양시 백양로 8&language=ko'),source = 'google', output = 'latlona')
cen <- c(myhome$lon,myhome$lat)
myhome2 <- data.frame(myhome$lon,myhome$lat)
mt <- ifelse(today <=14,"terrain",
             ifelse(today<= 29, "satellite",
                    ifelse(today<=44, "roadmap","hybrid")))
map <- get_googlemap(center=cen, maptype=mt,zoom=16, marker=myhome2)
ggmap(map) + labs(x="위도",y="경도",title="우리 동네") +
  geom_text(aes(x=myhome$lon, y=myhome$lat, label="우리집", vjust=0, hjust=0))

ggsave("mymap.png") 




