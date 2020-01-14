# [ 지도 출력 실습(1) ]
mk <- geocode(enc2utf8("경기도 성남시 분당구 정자동"), source = "google")
cen <- c(mk$lon, mk$lat)
sec <- as.numeric(format(strptime(Sys.time(), "%Y-%m-%d %H:%M:%S"), "%S"))
map <- get_googlemap(center = cen, maptype = ifelse(sec >= 0 & sec <= 14, "terrain",
                                                    ifelse(sec >= 15 & sec <= 29, "satellite",
                                                           ifelse(sec >= 30 & sec <= 44, "roadmap", hybrid))), zoom = 16)
print(sec)
ggmap(map) +
  labs(title = "전나영의 집", x = "경도", y = "위도") +
  geom_text(aes(x = mk$lon, y = mk$lat, label = "전나영의 집"), vjust = 0, hjust = 0)
ggsave("mymap.png")
