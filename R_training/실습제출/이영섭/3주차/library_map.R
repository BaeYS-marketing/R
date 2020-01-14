#지도 출력 실습 2
lib <- read.csv("data/지역별장애인도서관정보.csv", stringsAsFactors=F)
lib <- lib[,c(2,5,9,10)]

register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

addr <- lib$주소
g <- geocode(enc2utf8(addr))
location <- c(mean(lib$LON),mean(lib$LAT))
map <- get_googlemap(center=location,
                     maptype="roadmap",
                     zoom=11)
ggmap(map) + 
  geom_point(data=lib, aes(x=LON, y=LAT), alpha=1, size=3, color="red") + 
  geom_text(data=lib, aes(x=LON, y=LAT, label=lib$도서관명, vjust=0, hjust=0))

ggsave("library.png")
