# Q.2

info <- read.csv("지역별장애인도서관정보.csv", stringsAsFactors=F)
library_info = data.frame(name = info$도서관명,
                             lon=info$LON,
                             lat=info$LAT)
cen <- c(mean(info$LON),mean(info$LAT))
View(head(df))

map_seoul <- get_map(location="seoul", zoom=11, maptype="roadmap")    
ggmap(map_seoul)+
  geom_point(data=library_info, aes(x=lon, y=lat), alpha = 0)+
  geom_text(data=library_info, aes(label= name, vjust=0, hjust=0))
ggsave('library.png')
