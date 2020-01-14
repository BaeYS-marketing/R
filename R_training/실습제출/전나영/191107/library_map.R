# [ 지도 출력 실습(2) ]
mk <- geocode('Seoul', source = 'google')
cen <- c(mk$lon, mk$lat)
place <- read.csv("data/지역별장애인도서관정보.csv")
map <- get_googlemap(center = cen, maptype = "roadmap", zoom = 11)
ggmap(map) + geom_point(data = place, aes(x = place$LON, y = place$LAT), alpha = 0.5, size = 5, col = "red") +
  geom_text(data = place, aes(x = place$LON, y = place$LAT, label = place$도서관명, vjust = 0, hjust = 0))
ggsave("library.png")
