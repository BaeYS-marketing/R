#지도 출력 실습 1
library(ggmap)
sec <- substr(Sys.time(),18,19)

if (sec >= 0 & sec <=14){ type <- "terrain"
} else if (sec > 15 &sec <=29) {type <- "satellite"
} else if (sec > 30 &sec <=44) {type <- "roadmap"
} else {type <- "hybrid"}



register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
addr <- ("경기도 화성시 반송동 석우중학교")
g <- geocode(enc2utf8(addr))
location <- c(g$lon,g$lat)
map <- get_googlemap(center=location, 
                     maptype=type,
                     zoom=16,
                     marker=g)
ggmap(map)+ 
  geom_text(aes(x=g$lon, y=g$lat, label="집", vjust=0, hjust=0)) +
  labs(x="위도", y="경도", title="동네") + 
  theme(plot.title=element_text(face="bold"))
ggsave("mymap.png")
