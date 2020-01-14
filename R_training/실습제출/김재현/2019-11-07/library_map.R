library(dplyr)
library(ggmap)
library(ggplot2)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

# 지도 출력 실습(2)
x <- read.csv("지역별장애인도서관정보.csv", stringsAsFactors = F)

x_lonlat <- x[,c(2,10,9)]
x_mk <- data.frame(x_lonlat)

x_map <- get_map(location = "seoul", maptype = "roadmap", zoom = 11, markers = x_mk)
ggmap(x_map) + 
  geom_point(data = x, aes(x=LON, y = LAT), alpha=0.7, size=3, color="red") +
  geom_text(data = x, aes(x = LON, y = LAT), label = x$도서관명, size = 4, vjust = 0, hjust = 0) +
  ggsave("library.png")

