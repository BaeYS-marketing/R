register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

lib = read.csv("지역별장애인도서관정보.csv", stringsAsFactors = F)
head(lib)
str(lib)

lib_add = as.data.frame(lib[,"주소"])
names(lib_add) = c("address")
lib_add$address = iconv(lib_add$address, from="cp949", to="UTF-8")
lib_latlon = as.data.frame(lib[, c("LAT", "LON")])
lib_latlon = mutate_geocode(lib_add, address, source="google")

map_seoul = get_map(location="seoul", zoom=11, maptype="roadmap")
ggmap(map_seoul) +
  geom_point(data = lib_latlon, aes(x=lon, y=lat), alpha=0.5, size=3, color="red") +
  geom_text(data = lib_latlon, aes(x=lon, y=lat), label=lib$도서관명, vjust=0, hjust=0)
ggsave("library.png")
