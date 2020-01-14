lib <- read.csv("지역별장애인도서관정보.csv")
lib_loc <- data.frame(lib$LAT,lib$LON,lib$도서관명)
map_seoul <-get_map(location="seoul", zoom=11, maptype="roadmap")
ggmap(map_seoul) + 
  geom_point(data=lib_loc, aes(x=lib.LON, y=lib.LAT), alpha=0.6, size=5, color="red") +
  geom_text(data=lib_loc, aes(x=lib.LON, y=lib.LAT, label=lib.도서관명, vjust=0, hjust=0))

ggsave("library.png") 