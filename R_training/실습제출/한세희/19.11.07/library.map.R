
# 문제2
mk <- geocode(enc2utf8("서울"), source = "google")
cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=mk)
ggmap(map)


library <- read.csv("data/지역별장애인도서관정보.csv")
df <- data.frame(library$도서관명, library$LON, library$LAT)
mk <- data.frame(library$LON, library$LAT)
cen <- c(mean(df$library.LON),mean(df$library.LAT))
map <- get_googlemap(center=cen, maptype="roadmap",zoom=11, marker=mk)
ggmap(map)+geom_point(data=df, aes(x=library$LON, y=library$LAT), alpha=0.5, size=3, color="red")
ggsave()